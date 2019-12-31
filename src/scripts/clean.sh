#!/bin/bash

DATA=data/orig/tract_outcomes_early.csv 
# Get list of column names that we care about
COLS=$(csvcut -n $DATA | # Extract the column names in <lineno>: <colname> fmt
	cut -d ":" -f 2- | # Get any line that begins with `kfr` or `kir` 
	cut -c 2- | # Remove first space
	grep -E "^(kfr.*)|(kir.*)|(tract)|(state)|(county)" | # Get any line that begins with `kfr` or `kir`
	tr '\n' , | # Replace all newlines with commas
	sed 's/.$//') # Remove the last comma

csvcut -c $COLS $DATA | head -n 20
