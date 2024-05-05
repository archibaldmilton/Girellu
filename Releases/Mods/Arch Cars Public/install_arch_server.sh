#!/bin/bash

## Script which moves Arch data files to the appropriate folders of an AC Linux server
echo -e "Starting in interactive mode. \n Supported parameters: \n ./install_arch_server.sh --debug  # debug dry-run mode (no changes, prints lots of info)\n ./install_arch_server.sh --non-interactive # non-interactive mode, reads script config"

## Config
debug='0'
interactive_mode='1'  # 1 - true (default); 0 - false
contentdir_path=''
script_fullpath=$(realpath "$0")
use_cosmic_branch=''  # 0 to not use, 1 to use, empty to ask
shopt -s execfail  # ERR on failure


## Functions
# This function resets session variables in case the script fails in the middle of exec
failsafe_bash_env () {
        echo "Script failed. Restoring ENV vars."
        shopt -u nocasematch  && echo "- Unset case-insensitivity."
        shopt -u execfail && echo "- Unset execfail."
        echo "ENV vars restored."
        exit 1
}

# Restore terminal state if script ERRs
trap "failsafe_bash_env" ERR SIGINT SIGKILL SIGTERM SIGSTOP SIGQUIT

# How this function works: user_prompt "Question?" "Short answer 1" "Short answer 2" "Positive action" "Negative action"
# Verbose output plus status code $result_code 1 (true) and 0 (false)
# ex:
# user_prompt "Use cosmic branch?" "Y" "N" 'echo aa' 'echo bb'
user_prompt () {
        prompt_text="$1"  # first parameter passed to function
        choice_positive="$2"  # ex. "Y"
        choice_negative="$3"  # ex. "N"
        result_positive=${4}  # expand command
        result_negative=${5}
        result_code=''
        read -p "$prompt_text [ $choice_positive / $choice_negative ] " choice_user
        shopt -s nocasematch
        case "$choice_user" in
                "$choice_positive" ) $result_positive ; result_code='1' ;;
                "$choice_negative" ) $result_negative ; result_code='0' ;;
                * ) echo "Invalid input." ; exit 1
        esac
        shopt -u nocasematch

        return 0  # function status (trap monitors this)
}


## Setup

# Check if running as root; not advised
if [[ "$EUID" -eq '0' ]];then echo "Do NOT run as root. Exiting." ; exit 1 ; fi


# Parameter checks
# If instead of case because Case wouldn't support If-OR
if [[ ! -z $@ ]];then
	for passed_parameter in $@;do
		# Interactive mode setup
		if [[ "$passed_parameter" =~ '--non-interactive' ]];then 
			interactive_mode='0'
			if [[ -z "$contentdir_path" ]]; then echo "CFG variable contentdir_path is empty. Exiting. Please assign value." && exit 1 ; fi
			if [[ -z "$use_cosmic_branch" ]]; then echo "CFG variable use_cosmic_branch is empty. Exiting. Please assign value." && exit 1 ; fi
			parameter_matched='1'
		else 
			interactive_mode='1'
		fi

		# Apply debug flags to rsync if in debug mode
		# ./script debug
		# change CFG variable in script
		if [[ "$passed_parameter" =~ '--debug' ]] || [[ "$debug" -eq '1' ]];then
			echo "-DEBUG MODE ENABLED-"
			rsync_flags='--dry-run -avh'
			debug='1'
			parameter_matched='1'
		else
			rsync_flags='-a'
		fi
		if [[ -z "$parameter_matched" ]];then echo "Incorrect parameter. Exiting." && exit 1 ; fi
	done
fi

# Determine whether cosmic branch will be used or legacy
if [[ ! "$use_cosmic_branch" -eq '0' ]] || [[ ! "$use_cosmic_branch" -eq '1' ]];then
        user_prompt "Use cosmic branch?" "Y" "N" 'echo - Cosmic branch selected.' 'echo - Regular branch selected.'
        case "$result_code" in
                1)
                        use_cosmic_branch='1'
                ;;

                0)
                        use_cosmic_branch='0'
                ;;
                *)
                        exit 1
                ;;
        esac
fi

# Get absolute path to repo Arch cars dir
repo_dir=$(echo "$script_fullpath" | sed -E 's#(^.*/).*#\1#g' )


# Find server content dir
contentdir_manual () {
        read -p "Input AC Server car content directory (e.g. '*/content/cars'): [leave empty to autosearch]" contentdir_path
}

if [[ -z "$contentdir_path" ]];then
        read -p "Start autosearch in homedir for AC Server car content directory (e.g. '*/content/cars/') ? [Y / N]: " search_choice
        case "$search_choice" in
                [Yy])
                        echo "Searching..."
                        contentdir_path=$(find ~/ -type d -path "*content/cars/ks*" -print -quit | sed -E 's#(^.*/)ks_.*#\1#' )
                        if [[ -n "$contentdir_path" ]]; then echo "Found: ${contentdir_path} " ; read -p "Confirm [Y / N]: " confirm_choice
                                case "$confirm_choice" in
                                        [Yy])
                                                echo "Confirmed."
                                        ;;
                                        [Nn])
                                                contentdir_manual
                                        ;;
                                esac
                        fi
                ;;
                [Nn])
                        contentdir_manual
                ;;
                *)
                        exit 1
                ;;
        esac
fi

echo "Chosen directory: ${contentdir_path}"


# Load donor_cars.txt as array
directory_instructions=$(cat "$repo_dir"/donor_cars.txt |head -n 10)

# Get Arch car folders
repo_cars=$(find "$repo_dir" -maxdepth 1 -type d -name "Arch*")



## Main
# Issue is that donor_cars doesn't contain folder names
for line in ${directory_instructions[@]}; do
        arch_car=$(echo "$line" | cut -d',' -f1 )
        kunos_src_car=$(echo "$line" | cut -d',' -f2)

        echo ; echo ; echo
        echo "Installing ${arch_car} ..."

        # Determine whether to use cosmic branch or legacy branch arch files
        if [[ "$use_cosmic_branch" -eq '1' ]];then
                arch_src=$(find "$repo_dir" -type d -path "*Legacy*" -prune -o -name "$arch_car" -print)
        elif [[ "$use_cosmic_branch" -eq '0' ]];then
                arch_src=$(find "$repo_dir" -type d -path "*Legacy*" -name "$arch_car" -print)
        else
                echo "No branch chosen." && exit 1
        fi
        # Fallback to Legacy repo if Arch car files aren't found (ex. DTM cars)
        if [[ -z "$arch_src" ]] && [[ "$use_cosmic_branch" -eq '1' ]];then
                echo "... FAILED! Arch car files not found in specified repo."
                echo "... Falling back to Legacy repo."
                arch_src=$(find "$repo_dir" -type d -path "*Legacy*" -name "$arch_car" -print)
                if [[ -z "$arch_src" ]];then
                        echo "... Arch car files not found. Skipping." && continue
                fi
        fi



        # Check if KS source exists
        if [[ ! -d "$contentdir_path/${kunos_src_car}" ]];then
                echo "... KS source doesn't exist. Skipping!" && continue
        fi
        # Create Arch folder if it doesn't exist
        if [[ -d "$contentdir_path/${arch_car}" ]];then
                echo "... folder already exists. Updating..."
        else
                mkdir "$contentdir_path"/${arch_car} && echo "... directory created."
        fi

        if [[ "$debug" -eq '1' ]];then
                echo "arch_car: $arch_car"
                echo "kunos_src_car: $kunos_src_car"
                echo "arch_src: $arch_src"
        fi

        # Copy contents
        rsync ${rsync_flags} "$contentdir_path"/${kunos_src_car}/ "$contentdir_path"/${arch_car}/ && echo "... KS content copied."
        rsync ${rsync_flags} "$arch_src"/ "$contentdir_path"/${arch_car}/ && echo "... Arch files copied."

        echo "... ${arch_car} installed!"
done

