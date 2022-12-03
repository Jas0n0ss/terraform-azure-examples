## Example: Azure Container Registry

This example provisions an Azure Container Registry

## Create

1. A Resource Group
2. An [Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry/)

```bash
[root@srv1 azure-acr]# tree
.
├── main.plantf
├── main.tf
├── outputs.tf
├── README.md
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf
[root@srv1 azure-acr]# terraform init -upgrade

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/azurerm...
- Finding latest version of hashicorp/random...
- Using previously-installed hashicorp/azurerm v3.34.0
- Installing hashicorp/random v3.4.3...
- Installed hashicorp/random v3.4.3 (signed by HashiCorp)

Terraform has made some changes to the provider dependency selections recorded
in the .terraform.lock.hcl file. Review those changes and commit them to your
version control system if they represent changes you intended to make.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
[root@srv1 azure-acr]# terraform plan -out main.plantf
azurerm_resource_group.example: Refreshing state... [id=/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/acr-resources]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated
with the following symbols:
  + create
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # azurerm_container_registry.example will be created
  + resource "azurerm_container_registry" "example" {
      + admin_enabled                 = false
      + admin_password                = (sensitive value)
      + admin_username                = (known after apply)
      + encryption                    = (known after apply)
      + export_policy_enabled         = true
      + id                            = (known after apply)
      + location                      = "eastasia"
      + login_server                  = (known after apply)
      + name                          = (known after apply)
      + network_rule_bypass_option    = "AzureServices"
      + network_rule_set              = (known after apply)
      + public_network_access_enabled = true
      + resource_group_name           = (known after apply)
      + retention_policy              = (known after apply)
      + sku                           = "Standard"
      + trust_policy                  = (known after apply)
      + zone_redundancy_enabled       = false
    }

  # azurerm_resource_group.example must be replaced
-/+ resource "azurerm_resource_group" "example" {
      ~ id       = "/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/acr-resources" -> (known after apply)
      ~ name     = "acr-resources" -> (known after apply) # forces replacement
      - tags     = {} -> null
        # (1 unchanged attribute hidden)
    }

  # random_string.name will be created
  + resource "random_string" "name" {
      + id          = (known after apply)
      + length      = 8
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = false
      + numeric     = false
      + result      = (known after apply)
      + special     = false
      + upper       = false
    }

Plan: 3 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  + login_server = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: main.plantf

To perform exactly these actions, run the following command to apply:
    terraform apply "main.plantf"
[root@srv1 azure-acr]# terraform apply main.plantf
azurerm_resource_group.example: Destroying... [id=/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/acr-resources]
azurerm_resource_group.example: Still destroying... [id=/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/acr-resources, 10s elapsed]
azurerm_resource_group.example: Destruction complete after 16s
random_string.name: Creating...
random_string.name: Creation complete after 0s [id=vxsqechz]
azurerm_resource_group.example: Creating...
azurerm_resource_group.example: Creation complete after 1s [id=/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/vxsqechz-resources]
azurerm_container_registry.example: Creating...
azurerm_container_registry.example: Still creating... [10s elapsed]
azurerm_container_registry.example: Creation complete after 20s [id=/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/vxsqechz-resources/providers/Microsoft.ContainerRegistry/registries/vxsqechz]

Apply complete! Resources: 3 added, 0 changed, 1 destroyed.

Outputs:

login_server = "vxsqechz.azurecr.io"
[root@srv1 azure-acr]# terraform output
login_server = "vxsqechz.azurecr.io"
```
## Verify that the resources are created

```bash
[root@srv1 azure-acr]# az acr list  --resource-group vxsqechz-resources -o table
NAME      RESOURCE GROUP      LOCATION    SKU       LOGIN SERVER         CREATION DATE         ADMIN ENABLED
--------  ------------------  ----------  --------  -------------------  --------------------  ---------------
vxsqechz  vxsqechz-resources  eastasia    Standard  vxsqechz.azurecr.io  2022-12-03T13:55:44Z  False
```

## clean up

```bash
[root@srv1 azure-acr]# terraform plan -destroy -out main.destroy.tfplan
random_string.name: Refreshing state... [id=vxsqechz]
azurerm_resource_group.example: Refreshing state... [id=/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/vxsqechz-resources]
azurerm_container_registry.example: Refreshing state... [id=/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/vxsqechz-resources/providers/Microsoft.ContainerRegistry/registries/vxsqechz]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated
with the following symbols:
  - destroy

Terraform will perform the following actions:

  # azurerm_container_registry.example will be destroyed
  - resource "azurerm_container_registry" "example" {
      - admin_enabled                 = false -> null
      - anonymous_pull_enabled        = false -> null
      - data_endpoint_enabled         = false -> null
      - encryption                    = [
          - {
              - enabled            = false
              - identity_client_id = ""
              - key_vault_key_id   = ""
            },
        ] -> null
      - export_policy_enabled         = true -> null
      - id                            = "/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/vxsqechz-resources/providers/Microsoft.ContainerRegistry/registries/vxsqechz" -> null
      - location                      = "eastasia" -> null
      - login_server                  = "vxsqechz.azurecr.io" -> null
      - name                          = "vxsqechz" -> null
      - network_rule_bypass_option    = "AzureServices" -> null
      - network_rule_set              = [] -> null
      - public_network_access_enabled = true -> null
      - quarantine_policy_enabled     = false -> null
      - resource_group_name           = "vxsqechz-resources" -> null
      - retention_policy              = [
          - {
              - days    = 7
              - enabled = false
            },
        ] -> null
      - sku                           = "Standard" -> null
      - tags                          = {} -> null
      - trust_policy                  = [
          - {
              - enabled = false
            },
        ] -> null
      - zone_redundancy_enabled       = false -> null
    }

  # azurerm_resource_group.example will be destroyed
  - resource "azurerm_resource_group" "example" {
      - id       = "/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/vxsqechz-resources" -> null
      - location = "eastasia" -> null
      - name     = "vxsqechz-resources" -> null
      - tags     = {} -> null
    }

  # random_string.name will be destroyed
  - resource "random_string" "name" {
      - id          = "vxsqechz" -> null
      - length      = 8 -> null
      - lower       = true -> null
      - min_lower   = 0 -> null
      - min_numeric = 0 -> null
      - min_special = 0 -> null
      - min_upper   = 0 -> null
      - number      = false -> null
      - numeric     = false -> null
      - result      = "vxsqechz" -> null
      - special     = false -> null
      - upper       = false -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.

Changes to Outputs:
  - login_server = "vxsqechz.azurecr.io" -> null

───────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: main.destroy.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "main.destroy.tfplan"
[root@srv1 azure-acr]# terraform apply  main.destroy.tfplan
azurerm_container_registry.example: Destroying... [id=/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/vxsqechz-resources/providers/Microsoft.ContainerRegistry/registries/vxsqechz]
azurerm_container_registry.example: Destruction complete after 6s
azurerm_resource_group.example: Destroying... [id=/subscriptions/9f64194f-f35d-4a5c-8d16-60811524df8d/resourceGroups/vxsqechz-resources]
azurerm_resource_group.example: Still destroying... [id=/subscriptions/9f64194f-f35d-4a5c-8d16-...df8d/resourceGroups/vxsqechz-resources, 10s elapsed]
azurerm_resource_group.example: Destruction complete after 16s
random_string.name: Destroying... [id=vxsqechz]
random_string.name: Destruction complete after 0s

Apply complete! Resources: 0 added, 0 changed, 3 destroyed.

```