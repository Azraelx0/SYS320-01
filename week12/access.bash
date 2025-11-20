#!/bin/bash

Logfile="/home/champuser/SYS320-01/week12/fileaccesslog.txt
Timestamp=$(date '+%Y-%m-%d %H:%M:%S')

echo "[Timestamp] File userlogs-1.bash was accessed" >> "$Logfile"

echo "To: caden.mercer@mymail.champlain.edu" > /tmp/emailform.txt
echo "Subject: File Access Log" >> /tmp/emailform.txt
echo " " >> /tmp/emailform.txt
cat "$Logfile" >> /tmp/emailform.txt
cat /tmp/emailform.txt | ssmpt caden.mercer@mymail.champlain.edu
