#!/bin/bash

# Scrape site
html=$(curl -s "http://10.0.17.6/Assignment.html")

# Note: In my script "Temprature" is spelt wrong on purpose as the site spells it wrong and sed is matching to that phrase. 
temp_section=$(echo "$html" | sed -n '/Temprature Read:/,/Pressure Read:/p')
pressure_section=$(echo "$html" | sed -n '/Pressure Read:/,$p')

# Get the data 
temp_data=$(echo "$temp_section" | grep -o '<td>[^<]*</td>' | \
	sed 's/<[^>]*>//g' | awk 'NR%2==1{temp=$0; getline; print temp, $0}')

pressure_data=$(echo "$pressure_section" | grep -o '<td>[^<]*</td>' | \
         sed 's/<[^>]*>//g' | awk 'NR%2==1{press=$0; getline; print press, $0}')

# Store in array
declare -A temp_map
while read -r temp timestamp; do
	if [[ -n "$timestamp" ]]; then
		temp_map["$timestamp"]="$temp"
	fi
done <<< "$temp_data"

# Merge based on timestamp
while read -r pressure timestamp; do
	if [[ -n "$timestamp" ]]; then
		temp="${temp_map[$timestamp]}"
		if [[ -n "$temp" ]]; then
			echo "$pressure $temp $timestamp"
		fi
	fi
done <<< "$pressure_data"
