File_path="$1"
Event="$2"
Recipient="caden.mercer@mymail.champlain.edu"
Subject="File Access Alert: $File_path"
echo ""
Body="The file $File_path was accessed (event:$Event)."
> fileaccesslog.txt
echo "$Body" "$Subject" "$Recipient" >> fileaccesslog.txt
cat fileaccesslog.txt | ssmtp caden.mercer@mymail.champlain.edu
