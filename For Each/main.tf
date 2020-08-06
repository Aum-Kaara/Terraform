
provider "azurerm" {
version = "=2.0.0"
features {}
}

variable "networks" {
  type = map(object({
    network_number    = number
    availability_zone = string
    tags              = map(string)
  }))
  default = {
    "network1" = {
      network_number = 1,
      availability_zone = ""
    }
  }
}
resource "azurerm_resource_group" "example" {
  name     = "resources"
  location = var.location
}

resource "azurerm_logic_app_workflow" "test" {
  for_each = var.networks
  name                = each.key
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}