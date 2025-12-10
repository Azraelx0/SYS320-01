#!/bin/bash

log="$1"
ioc="$2"

> report.txt

while read indicator; do
	grep "$indicator" "$log" | while read line; do
		ip=$(echo "$line" | awk '{print $1}')
		dt=$(echo "$line" | grep -oP '\[\K[^\]]+')
		page=$(echo "$line" | awk -F\" '{print $2}' | awk '{print $2}')
		echo "$ip $dt $page" >> report.txt
	done
done < "$ioc"
