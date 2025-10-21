function Get-LocalIOCList {
    $path = 'C:\Users\champuser\SYS320-01\Midterm\IOC.html'
    $html = Get-Content -Path $path -Raw
    $results = @()

    $table = [regex]::Match($html, "<table[^>]*>([\s\S]*?)</table>", "IgnoreCase")
    if ($table.Success) {
        foreach ($tr in [regex]::Matches($table.Groups[1].Value, "<tr[^>]*>([\s\S]*?)</tr>", "IgnoreCase")) {
            $row = $tr.Groups[1].Value
            $cells = [regex]::Matches($row, "<t[dh][^>]*>([\s\S]*?)</t[dh]>", "IgnoreCase")
            if ($cells.Count -ge 2) {
                $p = ($cells[0].Groups[1].Value -replace "<[^>]+>", '') -replace "^\s+|\s+$",''
                $e = ($cells[1].Groups[1].Value -replace "<[^>]+>", '') -replace "^\s+|\s+$",''
                if ($p) { $results += [pscustomobject]@{ Pattern = $p; Explanation = $e } }
            }
        }
    }

return $results
}