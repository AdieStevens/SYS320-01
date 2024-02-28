. (Join-Path $PSScriptRoot menu-functions.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot Users.ps1)

clear

$Prompt = "Please choose your operation:`n"
$Prompt += "1 - Display last 10 apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Start Chrome web browser and navigate it to champlain.edu - if no instances of Chrome is running`n"
$Prompt += "5 - Exit`n"

$operation = $true

while($operation){

    Write-Host $Prompt | Out-String
    $choice = Read-Host


    if($choice -eq 5){
        Write-Host "Dueces" | Out-String
        exit
        $operation = $false
   
   }



    elseif($choice -eq 1){
        Get-LastApacheLogs
   
   
    }

    elseif($choice -eq 2){

        $name = Read-Host -Prompt "Please enter the username for the user's failed login logs"

        # TODO: Check the given username with the checkUser function.

        $userLogins = getFailedLogins 90
        # TODO: Change the above line in a way that, the days 90 should be taken from the user

        Write-Host ($userLogins | Where-Object { $_.User -ilike "*$name"} | Format-Table | Out-String)
    }



     elseif($choice -eq 3) {
        $days = Read-Host -Prompt "Please enter the number of days to check for at-risk users"
        riskUsers $days
    }


    elseif($choice -eq 4) { 
        Manage-ChromeProcess
    }

    else { 
        Write-Host "Invalid Option. Please enter a number from the menu." | Out-String
    }
}
