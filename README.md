# Terraform-azure-examples
terraform-azure-examples-Tutorials
- https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

# Terraform on Azure documentation
https://learn.microsoft.com/en-us/azure/developer/terraform/

## Example on azure VM
[Terraform Create azure VM](azure-vm)
[Terraform Create azure VNET](azure-vnet)

## Terraform usage examples

```bash
[root@srv1 azure-vm]#  terraform init
[root@srv1 azure-vm]#  terraform fmt
[root@srv1 azure-vm]#  terraform plan -out main.tfplan
[root@srv1 azure-vm]#  terraform apply main.tfplan
[root@srv1 azure-vm]#  terraform output -raw tls_private_key >  id_rsa  
[root@srv1 azure-vm]#  terraform output public_ip_address 
[root@srv1 azure-vm]#  ssh -i id_rsa azureuser@<public_ip_address> 

# clean up 
[root@srv1 azure-vm]#  terraform plan -destroy -out main.destroy.tfplan
[root@srv1 azure-vm]#  terraform apply main.destroy.tfplan
```