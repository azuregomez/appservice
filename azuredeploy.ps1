$rgname = "ASE01-RG"
$location = "North Central US"
$templateuri = "https://raw.githubusercontent.com/azuregomez/appservice/master/azuredeploy.json"
$templateparamuri = "https://raw.githubusercontent.com/azuregomez/appservice/master/azuredeploy.parameters.json"
#$templatefile = "C:\projects\github\appservice\azuredeploy.json"
#$templateparamfile = "C:\projects\github\appservice\azuredeploy.parameters.json"
$rg = get-azurermresourcegroup -location $location -name $rgname
if ($null -eq $rg)
{
    new-azurermresourcegroup -location $location -name $rgname
}
# deploy 
New-AzureRmResourceGroupDeployment -ResourceGroupName $rgname -TemplateUri $templateuri -TemplateParameterUri $templateparamuri
#New-AzureRmResourceGroupDeployment -ResourceGroupName $rgname -TemplateFile $templateFile -TemplateParameterFile $templateparamfile 


