function Get-FilteredIPsAndCount {
    param(
        [string]$PageName,
        [int]$ResponseCode,
        [string]$BrowserName
    )

    $logFilePath = "C:\xampp\apache\logs\access.log"
    $logEntries = Get-Content $logFilePath | Select-String "$PageName.*$ResponseCode.*$BrowserName"
    
    $regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
    $matches = $regex.Matches($logEntries)
    $ips = $matches | ForEach-Object { $_.Value }

    $ipCounts = $ips | Group-Object | Select-Object Count, Name

    return $ipCounts
}

