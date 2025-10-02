. (Join-Path $PSScriptRoot ScrapeClasses.ps1)

# List all classes of Instructor Furkan Paligu
$FullTable | Format-List "Class Code", Instructor, Location, Days, "Time Start", "Time End" | `
             Where-Object {$_.Instructor -ilike "Furkan Paligu" }           

# List all the classes of Joyce 310 on Mondays. Only show class code and times
# Sort by start time
$FullTable | Where-Object { ($_.Location -ilike "JOYC 310") -and ($_.days -contains "Monday") } | `
            Sort-Object "Time Start" | `
            Format-Table "Time Start","Time End","Class Code"

# Make a list of all the instructors that teach at least 1 course in 
# SYS, SEC, NET, CSI, FOR, DAT
# Sort by name and make it unique
$ITSInstructors = $FullTable | Where-Object {($_. "Class Code" -ilike "SYS*") -or `
                                             ($_. "Class Code" -ilike "NET*") -or `
                                             ($_. "Class Code" -ilike "SEC*") -or `
                                             ($_. "Class Code" -ilike "FOR*") -or `
                                             ($_. "Class Code" -ilike "CSI*") -or `
                                             ($_. "Class Code" -ilike "DAT*") } ` 
                            | Sort-Object "Instructor"
                            | Select-Object "Instructor" -Unique
$ITSInstructors

# Group all instructors by number of classes they teach
$FullTable | Group-Object {$_.Instructor -in $ITSInstructors.Instructor } `
           | -Property "Instructor" | Select-Object Count,Name | Sort-Object Count -Descending