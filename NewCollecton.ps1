Function New-Collection {
    $Config = Get-Content -Path ".\SCCMUtilitiesConfig\config.json" | ConvertFrom-Json
    foreach ($Collection in $($Config).Collections) {
        #Change MyCriteria1 and MyCriteria2 to the collection that you want to check for, add additional If statements for each criteria you have
        If ($Config.LimitingCollectionLookup -like "*$Collection*") {
            New-CMDeviceCollection -Name "$Collection" -LimitingCollection "$Config.LimitingCollectionLookup"
        }
        If ($Collection -like "*MyCriteria2*") {
            New-CMDeviceCollection -Name "$Collection" -LimitingCollection
        }
    }
}