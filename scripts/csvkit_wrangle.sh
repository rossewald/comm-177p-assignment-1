# FEEDBACK: Great job overall Ross! The code
# is elegant and well-documented, and I appreciated
# how you used the output flag for wget so that
# subsequent runs of the script will work correctly.
# However, note that there's one subtle but critical
# bug in the program when you redirect the output
# from csvgrep. It appears you used the "append" mode
# of redirection (>>) as opposed to the simpler
# redirect (>) which overwrites pre-existing content.
# Because you're appending lines rather than over-writing,
# the banks count will grow increasingly large on subsequent runs
# (unless you manually clear out failed_banks_ca.csv).

# Get a CSV of all failed banks and save it to a local file called failed_banks.csv
wget -O failed_banks.csv https://www.fdic.gov/bank/individual/failed/banklist.csv

# Create a CSV of all failed banks in CA and save it to failed_banks_ca.csv
# NOTE: Use basic file redirection (>) rather than appending (>>)
csvgrep -m "CA" -c "3" failed_banks.csv > failed_banks_ca.csv

# Get the number of lines in this file.
csv_size=$(cat failed_banks_ca.csv  | wc -l)
# Number of CA failed banks is one less (bc header)
failed_banks=`expr $csv_size - 1`

# Print the number of failed banks in CA.
echo There are $failed_banks failed banks in CA
