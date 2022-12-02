# Create a resource group
resource "azurerm_resource_group" "terraform" {
  name     = "terraform-rg"
  location = "East Asia"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "terraform" {
  name                = "terraform-net"
  resource_group_name = azurerm_resource_group.terraform.name
  location            = azurerm_resource_group.terraform.location
  address_space       = ["10.2.0.0/16"]
}