function ParseApacheLogs(){
$logsnotformatted = Get-Content C:\xampp\apache\logs\access.log
$tablerecords = @()

for ($i=0; $i -lt $logsnotformatted.Count; $i++){

# Split string into words
$words = $logsnotformatted[$i].Split(" ");
$tablerecords += [PSCustomObject]@{ "IP" = $words[0]; `
                                    "Time" = $words[3].Trim('['); `
                                    "Method" = $words[5].Trim('"'); `
                                    "Page" = $words[$6]; `
                                    "Protocol" = $words[7]; `
                                    "Response" = $words[8]; `
                                    "Referrer" = $words[10]; `
                                    "Client" = $words[11..($words.Length-1)] -join ' '); }
} # End of for loop
return $tablerecords | Where-Object {$_.IP -like "10.*"}
}
$tablerecords = ParseApacheLogs
$tablerecords | Format-Table -AutoSize -Wrap