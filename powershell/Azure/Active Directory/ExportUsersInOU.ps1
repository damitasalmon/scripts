$OUpath = 'OU=<ORGUNIT>,DC=<DOMAINCOMPONENT>,DC=<DOMAINCOMPONENT>'
$ExportPath = 'DEST PATH'
Get-ADUser -Filter * -SearchBase $OUpath | Select-object DistinguishedName,Name,UserPrincipalName | Export-Csv -NoType $ExportPath