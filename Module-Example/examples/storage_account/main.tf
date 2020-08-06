
provider "azurerm" {
  version = "=2.0.0"
  features {}
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}

resource "azurerm_resource_group" "resource-gp" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}


module "storage_account" {
    source = "./../../modules/storage_account"
    resource_group_name = azurerm_resource_group.resource-gp.name
    location = azurerm_resource_group.resource-gp.location

}
