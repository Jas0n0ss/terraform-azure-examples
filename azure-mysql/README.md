
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
terraform init
terraform plan -out main.tfplan
terraform apply main.tfplan
```

> Verify the results

```
#####
The values for the <resource_group_name>, <azurerm_mysql_flexible_server>, and <mysql_flexible_server_database_name> are displayed in the terraform apply output. You can also run the terraform output command to view these output values.
#####

az mysql flexible-server db show \
    --resource-group <resource_group_name> \
    --server-name <azurerm_mysql_flexible_server> \
    --database-name <mysql_flexible_server_database_name>
```
