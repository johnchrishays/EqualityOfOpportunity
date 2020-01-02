#!/bin/bash

# Unzip the tract outcomes data if doesn't exist
if [ ! -e data/orig/tract_outcomes_early.csv ]
  then 
    echo "Unzipping tract_outcomes..."
    unzip data/orig/tract_outcomes.zip -d data/orig/
    echo "Done."
fi

# Unzip crosswalk from tracts to school districts if doesn't exist
YR=19
if [ ! -d data/orig/GRF${YR} ]
  then 
    echo "Unzipping GRF${YR}.zip..."
    unzip data/orig/GRF${13}.zip -d data/orig/
    echo "Done."
fi

DATA=data/orig/tract_outcomes_early.csv 
# Get list of column names that we care about
COLS=$(csvcut -n $DATA | # Extract the column names in <lineno>: <colname> fmt
	cut -d ":" -f 2- | # Get any line that begins with `kfr` or `kir` 
	cut -c 2- | # Remove first space
	grep -E "^(tract)|(state)|(county)" | # Get any line that begins with `kfr` or `kir`
	tr '\n' , | # Replace all newlines with commas
	sed 's/.$//') # Remove the last comma

csvcut -c $COLS $DATA | head -n 20
