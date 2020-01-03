#!/bin/bash

# Unzip the tract outcomes data if doesn't exist
if [ ! -e data/orig/tract_outcomes_early.csv ]
  then 
    echo "Unzipping tract_outcomes..."
    unzip data/orig/tract_outcomes.zip -d data/orig/
    echo "Done."
fi

# Unzip crosswalk from tracts to school districts if doesn't exist
YR=13
if [ ! -e data/orig/GRF${YR}/grf${YR}_lea_tract.csv ]
  then 
    echo "Unzipping GRF${YR}.zip..."
    unzip data/orig/GRF${YR}.zip -d data/orig/
    sas7bdat_to_csv data/orig/GRF${YR}/grf${YR}_lea_tract.sas7bdat data/orig/GRF${YR}/grf${YR}_lea_tract.csv
    echo "Done."
fi

# Get list of column names that we care about
DATA=data/orig/tract_outcomes_early.csv 
COLS=$(csvcut -n $DATA | # Extract the column names in <lineno>: <colname> fmt
	cut -d ":" -f 2- | # Remove <lineno>:
	cut -c 2- | # Remove first space
	grep -E "^(tract)|(state)|(county)" | # Get any line that begins with `kfr` or `kir`
	tr '\n' , | # Replace all newlines with commas
	sed 's/.$//') # Remove the last comma

# New derived data directory
if [ ! -d data/deriv ]
  then mkdir data/deriv
fi

# Create a new column `fips` which combines state, county, tract codes into 11 digits used by some sources
echo "Now adding col fips."
python3 src/python/add_fips.py ${DATA}
echo "Done."

#  
