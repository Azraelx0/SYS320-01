function Find-Compromised {
    $logs = Get-ApacheAccessLogs
    $iocs = Get-IOCList

    for ($i = 0; $i -lt $logs.Count; $i++) {
        for ($j = 0; $j -lt $iocs.Count; $j++) {
            if ($logs[$i].Page -match [regex]::Escape($iocs[$j].Pattern)) {
                $logs[$i]
            }
        }
    }
}