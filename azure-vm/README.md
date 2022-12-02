
## Examples for the Virtual Machine resources

> Reference
https://developer.hashicorp.com/terraform/tutorials/azure-get-started

https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/virtual-machines

https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform


- install azure cli
https://learn.microsoft.com/zh-cn/cli/azure/install-azure-cli
- install terraform 
https://developer.hashicorp.com/terraform/downloads

```
# create related files
> dir 
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----         2022/12/2     12:48                .terraform
-a----         2022/12/2     13:04           3230 .terraform.lock.hcl
-a----         2022/12/2     13:02           4334 main.tf
-a----         2022/12/2     13:08           7780 main.tfplan
-a----         2022/12/2     13:02            297 output.tf
-a----         2022/12/2     13:02            365 providers.tf
-a----         2022/12/2     13:08           1032 README.md
-a----         2022/12/2     13:14          39763 terraform.tfstate
-a----         2022/12/2     13:02            316 variables.tf
> terraform init
> terraform fmt
> terraform plan -out main.tfplan
> terraform apply main.tfplan
> terraform output -raw tls_private_key > id_rsa  # export ssh key
> terraform output public_ip_address # get public VM ip
> ssh -i id_rsa azureuser@<public_ip_address>

# clean up 
> terraform plan -destroy -out main.destroy.tfplan
> terraform apply main.destroy.tfplan
```




