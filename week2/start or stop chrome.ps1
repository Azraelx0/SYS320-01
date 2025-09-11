# If Chrome is NOT running Champlain.edu start an instance, if instance is running stop it. 
$ProcessName = "chrome"
$ExecutablePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

$Process = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue

if($Process){
    Stop-Process -Name $ProcessName -Force
}else{
    Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe" -ArgumentList "https://www.champlain.edu/"
}