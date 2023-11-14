#!/bin/bash

## Script which moves Arch data files to the appropriate folders of an AC Linux server

## Config
assetto_rootdir=''
current_dir=$()
cosmic_branch=$(echo Use cosmic branch?)
shopt -s execfail  # ERR on failure


# This function resets session variables in case the script fails during runtime
failsafe_bash_env () {	
	echo "Script failed. Failsafe function ran."
	shopt -u nocasematch  && echo "- Unset case-insensitivity"
	shopt -u execfail && echo "- Unset execfail."
	exit 1
}

trap "failsafe_bash_env" ERR SIGINT SIGKILL SIGTERM SIGSTOP SIGQUIT

## Use: user_prompt "Question?" "Short answer 1" "Short answer 2" "Positive action" "Negative action"
## Returns status code 1 (true) and 0 (false)
## ex:
## user_prompt "Use cosmic branch?" "Y" "N" 'echo aa' 'echo bb'
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

user_prompt "Use cosmic branch?" "Y" "N" 'echo - Cosmic branch selected.' 'echo - Regular branch selected.'

## TODO: get current dir, edit cfg by self maybe?
## TODO: trap ERR and then trap - ERR to set and unset trapping - stages of install
## TODO: everything else 
