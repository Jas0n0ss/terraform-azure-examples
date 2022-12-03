
## Examples for the Virtual Machine resources

>  Reference

- https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/virtual-machines

- https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform

- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine

- https://gmusumeci.medium.com/how-to-deploy-a-centos-linux-vm-in-azure-using-terraform-64d972008282



> install azure cli

https://learn.microsoft.com/zh-cn/cli/azure/install-azure-cli
> install terraform 

https://developer.hashicorp.com/terraform/downloads

> Get started
```hcl
[root@srv1 azure-vm]# cat output.tf
output "resource_group_name" {
  value = azurerm_resource_group.main.name
}
output "computer_name" {
  value = azurerm_linux_virtual_machine.main.computer_name
}
output "admin_username" {
  value = azurerm_linux_virtual_machine.main.admin_username
}
output "public_ip_address" {
  value = azurerm_linux_virtual_machine.main.public_ip_address
}
```
```Bash
[root@srv1 azure-vm]# tree
.
├── main.tf
├── output.tf
├── plan.maintf
├── README.md
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf

[root@srv1 azure-vm]# terraform validate
Success! The configuration is valid.
[root@srv1 azure-vm]# terraform fmt
[root@srv1 azure-vm]# terraform init
[root@srv1 azure-vm]# terraform plan -out main.plantf
[root@srv1 azure-vm]#  terraform apply main.tfplan
...
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

admin_username = "adminuser"
computer_name = "azvmlab-vm"
public_ip_address = "20.205.119.197"
resource_group_name = "azvmlab-resources"

[root@srv1 azure-vm]# terraform output admin_username
"adminuser"
[root@srv1 azure-vm]# terraform output public_ip_address
"20.205.119.197"

```

> Check Out

```bash
[root@srv1 azure-vm]# az login
[root@srv1 azure-vm]# az vm list --resource-group azvmlab-resources --show-details -o table
Name        ResourceGroup      PowerState    PublicIps       Fqdns    Location    Zones
----------  -----------------  ------------  --------------  -------  ----------  -------
azvmlab-vm  azvmlab-resources  VM running    20.205.119.197           eastasia
[root@srv1 azure-vm]# ssh adminuser@20.205.119.197

```
# clean up 
```
[root@srv1 azure-vm]#  terraform plan -destroy -out main.destroy.tfplan
[root@srv1 azure-vm]#  terraform apply main.destroy.tfplan
```




