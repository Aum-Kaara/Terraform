resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_sql_server" "sql_server" {
  name                         = "mysqlserver-dev01"
  resource_group_name          = "${azurerm_resource_group.example.name}"
  location                     = "${azurerm_resource_group.example.location}"
  version                      = "12.0"
  administrator_login          = "mysqlserver"
  administrator_login_password = "Coder@2009"
}

resource "azurerm_sql_database" "sql_database" {
  name                = "mysqldatabase"
  resource_group_name = "${azurerm_resource_group.example.name}"
  location            = "${azurerm_resource_group.example.location}"
  server_name         = "${azurerm_sql_server.sql_server.name}"
  edition             = "Basic"
  tags = {
    environment = "dev"
  }
}