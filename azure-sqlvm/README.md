# Terraform Manages a Microsoft SQL Virtual Machine
azurerm_mssql_virtual_machine

- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_virtual_machine

```hcl
data "azurerm_virtual_machine" "example" {
  name                = "example-vm"
  resource_group_name = "example-resources"
}

resource "azurerm_mssql_virtual_machine" "example" {
  virtual_machine_id               = data.azurerm_virtual_machine.example.id
  sql_license_type                 = "PAYG"
  r_services_enabled               = true
  sql_connectivity_port            = 1433
  sql_connectivity_type            = "PRIVATE"
  sql_connectivity_update_password = "Password1234!"
  sql_connectivity_update_username = "sqllogin"

  auto_patching {
    day_of_week                            = "Sunday"
    maintenance_window_duration_in_minutes = 60
    maintenance_window_starting_hour       = 2
  }
}
```