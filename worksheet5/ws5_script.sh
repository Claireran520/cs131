#!/bin/bash

file_name="Global YouTube Statistics.csv"

country="United States"

categories=("Music" "Entertainment" "Gaming" "Comedy")

savein="./$country/"

# make sure there is directory
mkdir -p "$country"

for category in "${categories[@]}"; do
	
	awk -F, -v country="$country" -v category="$category"  '$8==country && $5==category {print}' "$file_name" > "${savein}${category}.txt"

	# count line for each txt file after save it
	wc -l "${savein}${category}.txt" >> ws5.txt
done
