. (Join-Path $PSScriptRoot "login_records.ps1")

clear

# Get Login and logoffs from the last 15 days
$loginoutsTable = Get-LoginLogoutRecords -NumberOfDays 15
$loginoutsTable

# Get Shut Downs from the last 25 days 
$shutdownsTable = Get-ComputerStartShutdownRecords -NumberOfDays 25 | Where-Object { $_.Event -eq "Shutdown" }
$shutdownsTable

# Get start ups from the last 25 days 
$startupsTable = Get-ComputerStartShutdownRecords -NumberOfDays 25 | Where-Object { $_.Event -eq "Start" }
$startupsTable
