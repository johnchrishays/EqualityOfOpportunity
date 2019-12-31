#!/bin/bash

# Get list of column names that we care about

csvcut -n data/orig/tract_outcomes_early.csv | # Extract the column names in <lineno>: <colname> fmt
	cut -d ":" -f 2- | # Get any line that begins with `kfr` or `kir` 
	cut -c 2- | # Remove first space
	grep -E "(kfr.*)|(kir.*)|(tract)|(state)|(county)" # Get any line that begins with `kfr` or `kir`
