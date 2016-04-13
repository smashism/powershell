Clear-host
#$user = "test_user"
$user = read-host "Enter the username"
$surName = get-aduser -identity $user | select surName -expandproperty surName
$givenName = get-aduser -identity $user  | select givenName -expandproperty givenName
$proxydomain = "@domain.com"

set-aduser -identity $user -add @{proxyaddresses="smtp:"+$givenName.ToLower()+"."+$surName.ToLower()+$proxydomain}
set-aduser -identity $user -add @{proxyaddresses="SMTP:"+$givenName.ToLower()+"_"+$surName.ToLower()+$proxydomain}
