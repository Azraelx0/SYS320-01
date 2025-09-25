function getstartstoplog {
    $eventIds = @(6005,6006)

    $events = Get-WinEvent -LogName System | Where-Object {$eventIds -contains $_.Id}
    $result = $events | ForEach-Object {
    [pscustomobject]@{
        Time = $_.TimeCreated
        ID = $_.Id
        Event = switch ($_.ID) {
                6005 {"System Started"}
                6006 {"System Shutdown"}
              }
            User = "System"
        }
    }
    return $result
}