$rgname = "ASE01-RG"
$location = "North Central US"
#$templateuri = "https://raw.githubusercontent.com/azuregomez/pan-g-hub/master/azuredeploy.json"
$templatefile = "C:\projects\github\ase\azuredeploy.json"
$templateparamfile = "C:\projects\github\ase\azuredeploy.parameters.json"
$rg = get-azurermresourcegroup -location $location -name $rgname
if ($null -eq $rg)
{
    new-azurermresourcegroup -location $location -name $rgname
}
# deploy 
# New-AzureRmResourceGroupDeployment -ResourceGroupName $rgname -TemplateUri $templateuri -TemplateParameterFile $templateparamfile 
New-AzureRmResourceGroupDeployment -ResourceGroupName $rgname -TemplateFile $templateFile -TemplateParameterFile $templateparamfile 
# Test-AzureRmResourceGroupDeployment -ResourceGroupName $rgname -TemplateFile $templateFile -TemplateParameterFile $templateparamfile 

