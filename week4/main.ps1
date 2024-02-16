. .\Apache-Logs.ps1 # Dot source to import the function

$pageVisited = "index.html"
$httpCodeReturned = 200
$webBrowser = "Chrome"

$ipCounts = Get-FilteredIPsAndCount -PageName $pageVisited -ResponseCode $httpCodeReturned -BrowserName $webBrowser

$ipsoften = $ipCounts | Where-Object { $_.Name -ilike "10.*" }
$ipsoften

