# Terraform Provider for Azure (Resource Manager)

The AzureRM Provider 

```
resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

```