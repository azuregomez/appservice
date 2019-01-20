# ILB ASE behind App Gateway, Redis Cache in VNet and Service End Points
This template deploys:
<ul>
<li>A VNet with 4 subnets: ASE Subnet, WAF Subnet, Cache Subnet DMZ Subnet
<li>ILB App Service Environment in the ASE subnet - NO public IP
<li>App Gateway in the WAF Subnet with public IP and ASE in the backend pool
<li>An App Service Plan
<li>A Web Application in the ASP with code deployed from a github repo
<li>VisualStudio VM for RDP in the DMZ Subnet
<li>Redis Cache in Cache Subnet
<li>SQL Azure DB with Service Endpoints to ASE Subnet
<li>Storage Account with Service Endpoints to Cache Subnet
<li>Azure Key Vault with Service Endpoint to ASE Subnet
</ul>
<img src="https://storagegomez.blob.core.windows.net/public/images/securepaas.jpg"\>
The ASE IP is in the backend pool of App Gateway.
No VNet DNS needed since the requests come from outside.
To make it work you need to change DNS so it points to the App Gateway public IP.


