# Directory where .ps1 files are located. 
cd $PSScriptRoot

#list files based on the file name
$files=(Get-ChildItem)
for ($j=0; $j -le $files.count; $j++){

    if ($files[$j].Extension -ilike "*ps1"){
        Write-Host $files[$j].Name
    }
}