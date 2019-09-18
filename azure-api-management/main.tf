resource "azurerm_resource_group" "resource-gp" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_api_management" "api-management" {
  name                = "example-apim"
  location            = "${azurerm_resource_group.resource-gp.location}"
  resource_group_name = "${azurerm_resource_group.resource-gp.name}"
  publisher_name      = "My Company"
  publisher_email     = "company@terraform.io"

  sku {
    name     = "Developer"
    capacity = 1
  }
}