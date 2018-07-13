#!/bin/bash

battInfoGeneral=`pmset -g batt`

currPerc=$(echo $battInfoGeneral | grep -o '[0-9]\+%' | awk '{sub (/%/, "", $1); print $1}')

echo "$currPerc%"
