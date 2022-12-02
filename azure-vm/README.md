
## Examples for the Virtual Machine resources

>  Reference

- https://developer.hashicorp.com/terraform/tutorials/azure-get-started

- https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/virtual-machines

- https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform


> install azure cli

https://learn.microsoft.com/zh-cn/cli/azure/install-azure-cli
> install terraform 

https://developer.hashicorp.com/terraform/downloads

> Get started

```Bash
# create related files
[root@srv1 azure-vm]# tree
.
├── main.destroy.tfplan
├── main.tf
├── main.tfplan
├── output.tf
├── providers.tf
├── README.md
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf

0 directories, 9 files
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




