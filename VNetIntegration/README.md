This ARM template deploys:
<ul>
<li>VNet with WAF Subnet and App Service delegated subnet and Service Endpoint to SQL DB
<li>App Service Plan (Standard, not isolated SKU)
<li>Web App with the new VNet Integration: https://blogs.msdn.microsoft.com/appserviceteam/2018/10/17/new-app-service-vnet-integration-feature/
<li>Code for the Web App. https://github.com/azuregomez/PersonDemo
<li>SQL Azure DB with firewall to allow App Service delegated Subnet.  (note: Allow All Azure IPs is setup temporarily so the sample DB can be deployed)
<li>App Gateway with Web Application Firewall infront of the Web Application
<li>Web App IP restrictions to allow trafffic from App Gateway only
</ul>
This allows for the following topology:
<br/><br/>
<img src="https://storagegomez.blob.core.windows.net/public/images/vnetint.jpg">
