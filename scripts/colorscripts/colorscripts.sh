#! /bin/bash

randomScript="Colorscripts/Scripts/script-($(( $RANDOM % 30 + 1 )))"

~/$randomScript

# $(( $RANDOM % 50 + 1 )) random number between 1 and 50
