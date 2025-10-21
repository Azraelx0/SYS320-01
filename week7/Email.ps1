# note for $Password user the passwd generated from step 1/2
function SendAlertEmail($Body){
$From = "youremailhere"
$To = "youremailhere"
$Subject = "Suspicious Activity"

$Password = "yourpasswordhere" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
-Port 587 -UseSsl -Credential $Credential
}
SendAlertEmail "Body of email"
