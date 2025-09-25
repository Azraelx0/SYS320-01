# get login and logoff records from windows events
# get last 14 days
function getEventLog($days){
$loginouts = Get-EventLog system -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days)

$loginoutsTable = @()
for($i=0; $i -lt $loginouts.Count; $i++){

# Create event property value
$event = ""
if($loginouts[$i].EventID -eq 7001) {$event="Logon"}
if($loginouts[$i].EventID -eq 7002) {$event="Logoff"}

# Create user property value
$user = $loginouts[$i].ReplacementStrings[1]
$SIDString = "S-1-5-21-4145177231-505709127-2928218559-1002"
$SIDObject = New-Object System.Security.Principal.SecurityIdentifier $SIDString
$UserName = $SIDObject.Translate([System.Security.Principal.NTAccount]).Value


# Add custom new line to empty array
$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated; `
                                     "ID" = $loginouts[$i].EventID; `
                                     "Event" = $event; `
                                     "User" = $UserName;
                                     }
} # End for loop

return $loginoutsTable
}

