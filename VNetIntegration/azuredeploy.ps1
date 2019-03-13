# template file and params copied to local
$localpath = "{yourLocalPath}"
$templatefile = $localpath + "azuredeploy.json"
$templateparamfile = $localpath + "azuredeploy.parameters.json"
#get prefix from parameter file
$params = get-content $templateparamfile | ConvertFrom-Json
$prefix = $params.parameters.resourcenameprefix.value
# using template naming conventions for rg, sqlserver and keyvault
$rgname = $prefix + "-rg"
$sqlservername = $prefix + "-sqlserver"
$appname = $prefix
$vaultname = $prefix + "-keyvault"
$location = "Central US"
$rg = get-azresourcegroup -location $location -name $rgname
if ($null -eq $rg)
{
    new-azresourcegroup -location $location -name $rgname
}
# deploy 
New-AzResourceGroupDeployment -ResourceGroupName $rgname -TemplateFile $templateFile -TemplateParameterFile $templateparamfile 
#remove firewall rule that allowed for DB deployment from bacpac
write-host "Removing Firewall Rule that allowed importing the SQL Azure DB from a bacpac ..."
Remove-AzSqlServerFirewallRule -firewallrulename "AllowAllAzureIps" -resourcegroupname $rgname -servername $sqlservername -force
# Add App to AKV
Write-Host "Adding App MSI to AKV ..."
$principal = Get-AzADServicePrincipal -displayname $appname
$objectid = $principal.Id
Set-AzKeyVaultAccessPolicy -vaultname $vaultname -objectid $objectid -permissionsToSecrets get
write-host "Deployment Complete"

