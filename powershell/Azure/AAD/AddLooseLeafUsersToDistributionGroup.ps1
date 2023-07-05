<"comma", "separated", "list", "of", "emails"> | ForEach-Object {
    Add-DistributionGroupMember –Identity "<GROUP NAME>" –Member $_
    }