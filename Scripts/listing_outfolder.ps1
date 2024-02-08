cd $PSScriptRoot
$files=Get-ChildItem

$folderpath = "$PSScriptRoot/outfolder/"
$filePath = Join-Path -Path $folderPath "out.csv"

# List all the files that has the extensions ".ps1" and 
# Save the results to out.csv file
$files | Where-Object { $_.Extension -eq ".ps1" } | `
Export-Csv -Path $filePath