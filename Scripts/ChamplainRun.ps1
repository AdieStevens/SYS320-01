$chromeProcess = Get-Process "chrome" -ErrorAction SilentlyContinue

if ($chromeProcess -eq $null) { 
    Start-Process "chrome" -Argumentlist "https://www.champlain.edu"
    }
else {
    Stop-Process -Name "chrome" -Force
}
