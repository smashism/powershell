Clear-host

$user = read-host "Enter the username"

Import-Module ActiveDirectory
Get-ADUser -identity $user -Properties PasswordLastSet, msDS-UserPasswordExpiryTimeComputed | select samaccountname,@{ Name = "Password Set Date"; Expression={($_."PasswordLastSet")}},@{ Name = "Expiration Date"; Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}
