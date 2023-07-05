$groups = Import-Csv -Path "<PATH TO CSV>" -Delimiter ","

foreach ($group in $groups)
    {
        $name = $group.Name
        $nick = $group.Nick
        $foundElement = Get-AzADGroup -SearchString $name
        if ($foundElement)
        {
           
            Write-Output "$name already exists"
        } else
        {
            Write-Output "$name does not exists! ... Creating it"
            $mailGroup = New-DistributionGroup -Name $name -Alias $nick -Type "Security"
            Write-Output "Group created with Id $mailGroup.ObjectId"
        }
    }