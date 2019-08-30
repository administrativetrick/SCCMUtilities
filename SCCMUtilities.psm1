#Find the Path to the current module and set it as a base path for all other nested modules
$env:SCCMUtilites_BasePath = ([io.fileinfo]$MyInvocation.MyCommand.Path).DirectoryName