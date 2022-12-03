# Terraform-azure-examples
terraform-azure-examples-Tutorials
- https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

# Terraform on Azure documentation
https://learn.microsoft.com/en-us/azure/developer/terraform/

## Examples
[Terraform Create azure VM](azure-vm)
[Terraform Create azure VNET](azure-vnet)
[Terraform Create azure acr](azure-acr)
[Terraform Create azure sqlvm](azure-sqlvm)
[Terraform Create azure mysql](azure-mysql)


## Terraform usage examples

```bash
[root@srv1 azure-vm]# terraform --help
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Experimental support for module integration testing
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
```


```bash
[root@srv1 azure-vm]#  terraform init
[root@srv1 azure-vm]#  terraform fmt
[root@srv1 azure-vm]#  terraform validate
[root@srv1 azure-vm]#  terraform plan -out main.tfplan
[root@srv1 azure-vm]#  terraform apply main.tfplan
[root@srv1 azure-vm]#  terraform output public_ip_address 

# clean up 
[root@srv1 azure-vm]#  terraform plan -destroy -out main.destroy.tfplan
[root@srv1 azure-vm]#  terraform apply main.destroy.tfplan
```