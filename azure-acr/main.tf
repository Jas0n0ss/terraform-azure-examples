provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# Generate random value for the name
resource "random_string" "name" {
  length  = 8
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "azurerm_resource_group" "example" {
  name     = "${random_string.name.result}-resources"
  location = "${var.location}"
}

resource "azurerm_container_registry" "example" {
  name                = "${random_string.name.result}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  location            = "${azurerm_resource_group.example.location}"
  sku                 = "Standard"
}