This ARM template deploys:
<ul>
<li>VNet with WAF Subnet and App Service delegated subnet and Service Endpoint to SQL DB, AKV
<li>App Service Plan (Standard, not isolated SKU)
<li>Web App with the new VNet Integration: https://blogs.msdn.microsoft.com/appserviceteam/2018/10/17/new-app-service-vnet-integration-feature/
<li>Code for the Web App. https://github.com/azuregomez/PersonDemo
<li>SQL Azure DB with firewall configuration to allow App Service delegated Subnet. (Allow All Azure IPs is setup temporarily so the sample DB can be deployed)
<li>App Gateway with Web Application Firewall in front of the Web Application
<li>Web App IP restrictions to allow trafffic from App Gateway only
<li>Managed Service Identity for Web Application
<li>Azure Key Vault with SQL DB Connection string as secret
<li>Allow access to KV secrets from Web App with MSI
<li>Web App Portal configuration for Connection String using Key Vault Reference in the format: @Microsoft.KeyVault(SecretUri=https://{resourceprefix}-keyvault.vault.azure.net/secrets/dbcnstr/versiontobereplaced). 
</ul>
Release Notes:
<ul>
<li>The script azuredeploy.ps1 includes 2 additional steps: <br>a) Remove a temporary SQL firewall rule  <br>b) Allow the Web App MSI to Get KV secrets. c) Includes the secret version in CnString AKV Reference
<li>For the Web App Connection String, the string segment <i>versiontobereplaced</i>" has to be manually updated in the portal.  AKV references will not require version when the feature is released as Generally Available.
<li>For the most restrictive security, Azure Key Vault should have VNet restrictions enabled and allow only requests from the Web App delegated Subnet.  However, as of 3/12/2019 the Key Vault Service Endpoint does not work with the new VNet Integration - the Key Vault is still getting the request from one of the default Outbound public IPs of App Service.  
</ul>
Deployment Instructions:
<ol>
<li>Clone this repo
<li>Update the parameter file with your Resource Prefix and your AAD Object ID.  This is required so the template can add you as a Key Vault authorized principal. You can get your AAD Object id with the Powershell cmdlet Get-AzureRmADUser
<li>Run azuredeploy.ps1
<li>Browse to the AppGateway IP or DNS name. The Web App will not respond on azurewebsites.net because the WAF is in front.
</ol>
Application Architecture:
<br/><br/>
<img src="https://storagegomez.blob.core.windows.net/public/images/vnetint2.png">
