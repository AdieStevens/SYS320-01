Get-ChildItem -Recurse -Filter *.csv | ForEach-Object {
    $newPath = $_.Name -replace '\.csv$', '.log'
    Rename-Item -Path $_.Name -NewName $newPath -Force
}

Get-ChildItem Recurse