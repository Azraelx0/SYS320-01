echo "To: caden.mercer@mymail.champlain.edu" > emailform.txt
echo "Subject: Security Incident" >> emailform.txt
echo " " >> emailform.txt
echo "Test" >> emailform.txt
cat emailform.txt | ssmtp caden.mercer@mymail.champlain.edu
