#!/bin/bash

Logfile="/home/champuser/SYS320-01/week12/fileaccesslog.txt"
Timestamp=$(date '+%Y-%m-%d %H-%M-%S')

echo "[$Timestamp] File userlogs-1.bash was accessed" >> "$Logfile"

echo "To: caden.mercer@mymail.champlain.edu" > emailform.txt
echo "Subject: File Access Log" >> emailform.txt
echo " " >> emailform.txt
cat "$Logfile" >> emailform.txt
cat emailform.txt | ssmtp caden.mercer@mymail.champlain.edu
