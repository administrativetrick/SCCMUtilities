function Set-CurrentCMDrive {
cd "$($CMDrive):"
$CMDrive = Get-PSDrive -PSProvider CMSite
}