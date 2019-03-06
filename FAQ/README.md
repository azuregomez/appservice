<h3>What can I do to secure intra-application communication so that only your own apps can communicate with each other?</h3>
<ul>
<li>ILB App Service Environment is definitely the best way to accomplish this.
<li>Without an ASE you can use a combination of IP restrictions, taking requests from API Management exclusively.  In API Management you can establish a variety of authentication mechanisms including something as simple as an API Key.
<li>You can reduce the possibility of outside intrusion by using IP restrictions https://docs.microsoft.com/en-us/azure/app-service/app-service-ip-restrictions
and allow only the outbound IPs of the multitenant app services that you want to allow.  These IPs are not exclusive of your apps and may be used by other app services running within the same “stamp”.
<li>Managed Service Identities: https://blogs.msdn.microsoft.com/benjaminperkins/2018/06/13/using-managed-service-identity-msi-with-and-azure-app-service-or-an-azure-function/
This way the invoking app would get an identity in AAD and the target service would restrict to the set of service principals tat correspond to the invoking apps:
https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-restrict-your-app-to-a-set-of-users
</ul>
<h3>How can my App Services reach resources from my Data Center?</h3>
<ul>
<li>App Service Environment is definitely the best way to accomplish this.  It will take advantage of your ExpressRoute connection.
<li>The new VNet Integration (now in preview) will also support this scenario and take advantage of ExpressRoute. 
https://blogs.msdn.microsoft.com/appserviceteam/2018/10/17/new-app-service-vnet-integration-feature/
<li>Hybrid Connections for App Service would also work, but would not use ExpressRoute to reach back to your data center.  Azure Relay relies on Web Sockets for connectivity. https://docs.microsoft.com/en-us/azure/app-service/app-service-hybrid-connections
</ul>
<h3>DR with PaaS Services?</h3>
<ul>
<li>SQL DB has Active Geo-replication and Failover Groups that provide Active-Active BCDR:
https://docs.microsoft.com/en-us/azure/sql-database/sql-database-auto-failover-group
<li>For App Service with RTO >= 1 hr, you can do a re-deploy.  Here’s an example of how it’s implemented: https://github.com/azuregomez/PaaSDR
<li>For App Service with RTO < 1 hr, you can use multi-region deployment with a scaled down pre-created ASE and/or App Service Plan in the DR region.
</ul>