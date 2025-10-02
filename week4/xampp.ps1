# List all of apache logs
Get-Content C:\xampp\apache\logs\access.log

# Only list last 5 line
#Get-Content C:\xampp\apache\logs\access.log -Tail 5

# Display only logs that contain 404 or 400
#Get-Content C:\xampp\apache\logs\access.log | Select-String '404' , '400'

# Display only logs that DON'T contain 200
#Get-Content C:\xampp\apache\logs\access.log | Select-String '200' -NotMatch

# From every .log file get only logs that have word "error"
#$A = Get-ChildItem C:\xampp\apache\logs\*.log | Select-String -Pattern "error"
# Show last 5 elements of result array
#$A[-5..-0]

# Get only logs that contain 404, save to $notfounds
$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String '404'
# Define a regex for IP addresses
$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
# Get $notfound records that match to the regex
$ipsUnorganized = $regex.Matches($notfounds)
# Get ips as custom pscustomobject
$ips = @()
for ($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [pscustomobject]@{"IP" = $ipsUnorganized[$i].Value;}
   }
   #$ips | Where-Object { $_.IP -ilike "10.*" }

# Count ips from Number 8
$ipsoften = $ips | Where-Object { $_.IP -ilike "10.*" }
$counts = $ipsoften | Group-Object IP
$counts | Select-Object Count, Name
