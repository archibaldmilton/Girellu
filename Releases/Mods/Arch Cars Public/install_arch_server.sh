#!/bin/bash

## Script which moves Arch data files to the appropriate folders of an AC Linux server

## Config
contentdir_path=''
script_fullpath=$(realpath "$0")
use_cosmic_branch=''  # 0 to not use, 1 to use, empty to ask
shopt -s execfail  # ERR on failure


## Functions
# This function resets session variables in case the script fails during runtime
failsafe_bash_env () {	
	echo "Script failed. Failsafe function started."
	shopt -u nocasematch  && echo "- Unset case-insensitivity"
	shopt -u execfail && echo "- Unset execfail."
	echo "Failsafe function finished."
	exit 1
}

# Restore terminal state if script ERRs
trap "failsafe_bash_env" ERR SIGINT SIGKILL SIGTERM SIGSTOP SIGQUIT

## Use: user_prompt "Question?" "Short answer 1" "Short answer 2" "Positive action" "Negative action"
# Verbose output and returns $result_code 1 (true) and 0 (false)
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

# Get full path to repo Arch cars dir
repo_dir=$(echo "$script_fullpath" | sed -E 's#(^.*/).*#\1#g' )


# Find server content dir
contentdir_manual () {
	read -p "Input AC Server car content directory (e.g. '*/content/cars'): " contentdir_path
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
directory_instructions=$(cat "$repo_dir"/donor_cars.txt )

#TODO: for dir in arch cars, do etc
repo_cars=$(find "$repo_dir" -maxdepth 1 -type d -name "Arch*")

## Main
for line in ${directory_instructions[@]}; do
	car_source=$(echo "$line" | cut -d',' -f1 )
	car_dest=$(echo "$line" | cut -d',' -f2)
	echo "Installing ${car_dest} ..."
	mkdir "$contentdir_path"/${car_dest} && echo "... directory created."
	cp -r "$contentdir_path"/${car_source}/ "$contentdir_path"/${car_dest}/ && echo "... KS content copied."
	cp -r "$repo_dir"/
done




## TODO: get current dir, edit cfg by self maybe?
## TODO: trap ERR and then trap - ERR to set and unset trapping - stages of install
## TODO: everything else 
