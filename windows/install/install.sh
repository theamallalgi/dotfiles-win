#!/bin/bash

set -e # ensure that the script exits on any command failure

# individual scripts
SCOOP_SCRIPT="scoop.sh"
PIP_SCRIPT="pip.sh"

# run script and check for its existence
run_script() {
	local script=$1
	if [[ -f "$script" ]]; then
		echo -e "\n[i] running $script..."
		bash "$script"
	else
		echo "[!] $script not found. please ensure it exists in the current directory."
		exit 1
	fi
}

# ask for confirmation before running a script
run_script_with_query() {
	local script=$1
	local query=$2
	if [[ -f "$script" ]]; then
		echo -e "\n[?] $query"
		read -r response
		case "$response" in
		[Yy]* | "")
			echo "[i] running $script..."
			bash "$script"
			;;
		*)
			echo "[>] skipping $script."
			;;
		esac
	else
		echo "[!] $script not found. please ensure it exists in the current directory."
		exit 1
	fi
}

chmod +x scoop.sh pip.sh # grant required permissions to files

# install and/or run scripts
run_script_with_query "$SCOOP_SCRIPT" "[?] do you want to install your scoop library? (y/n):" # scoop lib
run_script_with_query "$PIP_SCRIPT" "[?] do you want to install your python packages? (y/n):" # pip lib

echo -e "\n[*] all installations completed successfully."
