$Owners = @("comma", "separated", "email addresses")
$Members = @("comma", "separated", "email addresses")
New-DistributionGroup -Name "<Name>" -Alias "<ALIAS>" -Type "Security" -ManagedBy $Owners -Members $Members
