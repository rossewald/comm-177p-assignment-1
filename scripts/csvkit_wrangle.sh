
# Get a CSV of all failed banks and save it to a local file called failed_banks.csv
wget -O failed_banks.csv https://www.fdic.gov/bank/individual/failed/banklist.csv

# Create a CSV of all failed banks in CA and save it to failed_banks_ca.csv
csvgrep -m "CA" -c "3" failed_banks.csv >> failed_banks_ca.csv

# Get the number of lines in this file.
csv_size=$(cat failed_banks_ca.csv  | wc -l)
# Number of CA failed banks is one less (bc header)
failed_banks=`expr $csv_size - 1`

# Print the number of failed banks in CA.
echo There are $failed_banks failed banks in CA
