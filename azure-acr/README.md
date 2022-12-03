## Example: Azure Container Registry

This example provisions an Azure Container Registry

## Creates

1. A Resource Group
2. An [Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry/)

## Verify that the resources are created

```bash
az acr connected-registry list --registry <REGISTRY_NAME> --output table
```