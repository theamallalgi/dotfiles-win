#! /bin/bash

randomScript="colorscripts/scripts/script-($(( $RANDOM % 29 + 1 )))"

~/$randomScript

# $(( $RANDOM % 50 + 1 )) random number between 1 and 50
