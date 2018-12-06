# ILB ASE behind App Gateway
This template deploys:
<ul>
<li>A VNet with 3 subnets: ASE Subnet, WAF Subnet and DMZ Subnet
<li>ILB App Service Environment in the ASE subnet
<li>App Gateway in the WAF Subnet
<li>An App Service Plan
<li>A Web Application in the ASP with code deployed from a github repo
<li>Bastion VM for RDP in the DMZ Subnet
</ul>
<img ref="https://storagegomez.blob.core.windows.net/public/images/ASE-AG.jpg"\>
The ASE IP is in the backend pool of App Gateway.
No VNet DNS needed since the requests come from outside.
To make it work you need to change DNS so it points to the App Gateway public IP.


