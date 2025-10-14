# Note sanitize input to only allow days to be taken as digits and execution time format as digit:digitdigit: AM/PM
# Display working config using pscustomobject

$configFile = "C:\Users\champuser\SYS320-01\week7\configuration.txt"
function readConfig(){
    $content = Get-Content $configFile
    $days = $content[0]
    $time = $content[1]
    return [pscustomobject]@{ "Days" = $days
                              "Execution Time" = $time
                               }
}


# Get new config from user and replace the old one with new
function changeConfig(){
    $validDays = $false
    while (-not $validDays){
        $days = Read-Host "Enter the number of days for which the logs will be obtained: "
        if ($days -match '^\d+$'){
            $validDays = $true
        }
        else{
            Write-Host "Invalid. Digits only."
        }
    }
    $validTime = $false
    while (-not $validTime){
        $time = Read-Host "Enter the daily execution time of the script: "
        if ($time -match '^\d{1,2}:\d{2}\s(AM|PM)$'){
            $validTime = $true
        }else{
            Write-Host "Invalid. Use H:MM AM/PM"
        }
    }
    $days | Out-File $configFile
    $time | Out-File $configFile -Append
    Write-Host "Configuration changed"
}


function configMenu (){
    $exit = $false
    while (-not $exit){
        Write-Host "`nPlease choose your operation:"
        Write-Host "1 - Show Configuration"
        Write-Host "2 - Change Configuration"
        Write-Host "3 - Exit"
        Write-Host ""

        $choice = Read-Host
        if ($choice -eq "1"){
            Write-Host ""
            readConfig | Format-Table -AutoSize
        }
        elseif ($choice -eq "2"){
            changeConfig
        }
        elseif ($choice -eq "3"){
            $exit = $true
        }
        else{
            Write-Host "Invalid. Enter 1-3"
        }
    }
}

configMenu