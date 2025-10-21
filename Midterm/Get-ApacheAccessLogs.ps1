function Get-ApacheAccessLogs {
    $regex = '^(?<ip>\S+)\s+\S+\s+\S+\s+\[(?<time>[^\]\s]+)(?:\s[^\]]+)?\]\s+"' `
    + '(?<method>\S+)\s+(?<page>\S+)(?:\s+(?<protocol>[^"]+))?"\s+(?<response>\d{3})\s+\S+\s+"(?<referrer>[^"]*)"'
    
    Get-Content "C:\Users\champuser\SYS320-01\Midterm\access.log" | ForEach-Object {
        if ($_ -match $regex) {
            [pscustomobject]@{
                IP       = $matches.ip
                Time     = $matches.time
                Method   = $matches.method
                Page     = $matches.page
                Protocol = $matches.protocol
                Response = $matches.response
                Referrer = $matches.referrer
            }
        }
    }
}