#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser" 
}

# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
function getFailedLogins(){
	cat /var/log/auth.log | grep -E "failure" | cut -d ' ' -f 1-8

}

# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: caden.mercer@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
echo "" >> emailform.txt
getLogins >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp caden.mercer@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 

