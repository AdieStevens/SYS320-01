clear
# Get-Content C:\xampp\apache\logs\access.log

# Get-Content C:\xampp\apache\logs\access.log -Tail 5

# Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 ',' 400 '

# $A = Get-ChildItem C:\xampp\apache\logs\*.log | Select-String 'error'
# $A[-1..-5]

# Get only logs that contain 404, save into $notfounds 
$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404' 

# Define a regex for IP addresses 
$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

# Get $notfounds records that match to the regex 
$ipsUnorganized = $regex.Matches($notfounds)

#Get ips as pscustomobject 

$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
 $ips += [PSCustomObject]@{ "IP" = $ipsUnorganized[$i].Value; }
}
#$ips | where-Object { $_.IP -ilike "10.*" }

#Count ips from Script Above 

$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*"}
$counts = $ipsoftens | Group ip
$counts | select-Object Count, Name
