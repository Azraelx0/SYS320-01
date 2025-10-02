function ApacheLogs(){
    param(
        [Parameter(Mandatory=$true)]
        [string]$Page,
        [Parameter(Mandatory=$true)]
        [string]$HTTPCode,
        [Parameter(Mandatory=$true)]
        [string]$Browser
      )
$url = "http://10.0.17.46/"

$ie = New-Object -ComObject internetexplorer.application
$ie.navigate($url)
while($ie.ReadyState -ne 4) {start-sleep -s 10}
$ie.visible=$true

$trs = $gc.Document.getElementsByTagName("tr")

$matchingIPs = @()
# Loop through each row
for($1=1; $i -lt $trs.length; $i++){
    $row = $trs.item($i)
    $tds = $row.getElementsByTagName("td")
    
    if($tds.length -gt 0){
        # Get data from table cells
        $ip = $tds.item(0).innerText
        $pageVisited = $tds.item(2).innerText
        $referrer = $tds.item(3).innerText
        $code = $tds.item(4).innerText
        $userAgent = $tds.item(5).innerText

        $pageMatch = ($pageVisited -ilike "*$Page*") -or ($referrer -ilike "*$Page*")
        $codeMatch = ($code -eq $HTTPCode)
        $browserMatch = ($userAgent -ilike "*$Browser*")

        if($pageMatch -and $codeMatch -and $browserMatch){
            $matchingIPs += $ip
        }
    }
}

$ie.Quit()


return $matchingIPs | Select-Object -Unique
}





