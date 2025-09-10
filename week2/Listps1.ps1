cd $PSScriptRoot

$files=(Get-ChildItem)
for ($j=0; $j -le $files.length; $j++){
    
    if ($files[$j].name -ilike "*ps1"){
        Write-Host $files[$j].name
    }
}

# Create folder if it does not exist
$folderpath="$PSScriptRoot\outfolder"
if (Test-Path $folderpath){
    Write-Host "Folder Already Exists"
}
else{
    New-Item -ItemType Directory -Path $folderpath
}

# Save results to out.csv file in outfolder dir
# Below is commented out to avoid error of out.csv already existing
#cd $PSScriptRoot
#$files = (Get-ChildItem)

#$folderPath = "$PSScriptRoot/outfolder/"
#$filePath = New-Item -ItemType File "$folderPath\out.csv"

#$files | Where-Object { $_.Extension -eq ".ps1" } | Export-Csv -Path $filePath
# Up to above warning is comment out

# Without changing directory change all .csv files to .log and display all files
$files = Get-ChildItem -Recurse -File
$files | Rename-Item -NewName { $_.Name -replace '.csv','.log' }
Get-ChildItem -Recurse -File