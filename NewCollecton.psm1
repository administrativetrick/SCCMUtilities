function New-Collection
{
	TRY
	{
		if ($($null -ne $env:SMS_ADMIN_UI_PATH) -and $($False -ne $(Test-Path $env:SMS_ADMIN_UI_PATH\..\ConfigurationManager.psd1 -PathType Leaf)))
		{
			Import-Module $env:SMS_ADMIN_UI_PATH\..\ConfigurationManager.psd1
		}
	}
	CATCH
	{
		Write-Error "Configuration Manager is not available to import, please install the Configuration Manager Console and try again."
	}
	#Import Configuration File for collections
	$CollectionConfig = Get-Content $env:SCCMUtilites_BasePath\Configs\CollectionConfig.json | ConvertFrom-Json
	#Import Configuration File for Application
	$ApplicationConfig = Get-Content $env:SCCMUtilites_BasePath\Configs\ApplicationConfig.json | ConvertFrom-Json
	#Change Directory to CMSite Provider
	Set-CurrentCMDrive
	$CollectionConfig.collections | ForEach-Object {
		New-CMDeviceCollection -Name "$($_.name)$($ApplicationConfig.Application.Vendor) $($ApplicationConfig.Application.Name) $($ApplicationConfig.Application.Version)" -LimitingCollectionId "$($_.LimitingCollection)"
	}
	Pop-Location
}