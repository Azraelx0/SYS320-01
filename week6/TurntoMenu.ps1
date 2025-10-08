# Call scripts needed
. (Join-Path $PSScriptRoot ParseApache.ps1)
. (Join-Path $PSScriptRoot Users.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot chromeprocess.ps1)
clear

# Menu Options
$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last 10 apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Start google chrome and open champlain.edu`n"
$Prompt += "5 - Exit`n"


$operation = $true
# Begin while loop
while($operation){
    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 

    if($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

# Display last 10 apache logs
    elseif($choice -eq 1){
        $apachelogs = ParseApacheLogs 30
        Write-Host ($apachelogs | Select-Object -Last 10 | Format-Table | Out-String)
    }

# Display last 10 failed logins for all users

    elseif($choice -eq 2){
        $failedlogins = getFailedLogins 30
        Write-Host ($failedlogins | Select-Object -Last 10 | Format-Table | Out-String)
    }

# Display at risk users
    elseif($choice -eq 3){
        $riskusers = getAtRiskUsers 90  # Note can replace 90 with any amount of days 
        Write-Host ($riskusers | Format-Table | Out-String)
    }

# If instance of chrome is not running, start it and navigate to champlain.edu
    elseif($choice -eq 4){    
        startChrome
    }

# Check for proper input option
    else{
        Write-Host "Invalid choice. Please select an option 1-5."
    }
}