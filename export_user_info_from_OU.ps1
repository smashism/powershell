import-module activedirectory
Get-ADUser -SearchBase "ou=YourOU,dc=YourDomain,dc=local" -Properties * -LDAPFilter '(name=*)' | Select DisplayName, EmailAddress, Description, Department, Manager, AccountExpiresDate | Export-Csv -NoType "users.csv"
