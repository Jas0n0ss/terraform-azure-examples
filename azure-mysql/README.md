
# Terraform to create an Azure Database for MySQL - Flexible Server
https://learn.microsoft.com/en-us/azure/mysql/flexible-server/quickstart-create-terraform?tabs=azure-cli
> In this article, you learn how to:

- Create an Azure resource group using azurerm_resource_group
- Create an Azure VNet using azurerm_virtual_network
- Create an Azure subnet using azurerm_subnet
- Define a private DNS zone within an Azure DNS using azurerm_private_dns_zone
- Define a private DNS zone VNet link using using azurerm_private_dns_zone_virtual_network_link
- Deploy Flexible Server using azurerm_mysql_flexible_server
- Deploy a database using azurerm_mysql_flexible_database

```bash
[root@srv1 azure-mysql]#
 terraform init
[root@srv1 azure-mysql]#
 terraform plan -out main.tfplan
[root@srv1 azure-mysql]#
 terraform apply main.tfplan
 
```

> Verify the results

```bash

# The values for the <resource_group_name>, <azurerm_mysql_flexible_server>, and <mysql_flexible_server_database_name> are displayed in the terraform apply output. You can also run the terraform output command to view these output values.

az mysql flexible-server db show \
    --resource-group <resource_group_name> \
    --server-name <azurerm_mysql_flexible_server> \
    --database-name <mysql_flexible_server_database_name>

[root@srv1 azure-mysql]# terraform output
azurerm_mysql_flexible_server = "mysqlfs-efpjaheo"
mysql_flexible_server_database_name = "mysqlfsdb_efpjaheo"
resource_group_name = "rg-tolerant-trout"
[root@srv1 azure-mysql]# az mysql flexible-server db show --resource-group rg-tolerant-trout --server-name mysqlfs-efpjaheo --database-name mysqlfsdb_efpjaheo -o table
Charset    Collation        Name                ResourceGroup
---------  ---------------  ------------------  -----------------
utf8       utf8_unicode_ci  mysqlfsdb_efpjaheo  rg-tolerant-trout
[root@srv1 azure-mysql]# az mysql flexible-server db show --resource-group rg-tolerant-trout --server-name mysqlfs-efpjaheo --database-name mysqlfsdb_efpjaheo -o yaml
charset: utf8
collation: utf8_unicode_ci
id: /subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/rg-tolerant-trout/providers/Microsoft.DBforMySQL/flexibleServers/mysqlfs-efpjaheo/databases/mysqlfsdb_efpjaheo
name: mysqlfsdb_efpjaheo
resourceGroup: rg-tolerant-trout
systemData: null
type: Microsoft.DBforMySQL/flexibleServers/databases
```
