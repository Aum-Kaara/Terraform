
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


resource "azurerm_api_management" "api-management" {
  name                = "mycomp-apim"
  location            = "${azurerm_resource_group.resource-gp.location}"
  resource_group_name = "${azurerm_resource_group.resource-gp.name}"
  publisher_name      = "My Company"
  publisher_email     = "company@terraform.io"

  sku_name = "Developer_1"
}

resource "azurerm_monitor_action_group" "main" {
  name                = "example-actiongroup"
  resource_group_name = azurerm_resource_group.resource-gp.name
  short_name          = "exampleact"

  webhook_receiver {
    name        = "callmyapi"
    service_uri = "http://example.com/alert"
  }
}

module "apim_monitor" {
    source = "./../../modules/apim_monitor"
    api_management_name = "mycomp-apim"
    backend_response_threshold = 1000
    gatewayresponse_threshold = 1000
    failedeventhub_threshold = 1
    rejectedeventhub_threshold = 1
    timedouteventhub_threshold = 1
    droppedeventhub_threshold = 1
    high_cpacity_threshold = 90
    resource_group_name = azurerm_resource_group.resource-gp.name
    location = azurerm_resource_group.resource-gp.location
    action_group_id = azurerm_monitor_action_group.main.id
    api_management_id = azurerm_api_management.api-management.id
}
