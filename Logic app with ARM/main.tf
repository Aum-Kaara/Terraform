resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_logic_app_workflow" "test" {
  name                = "workflow1"
  location            = "${azurerm_resource_group.example.location}"
  resource_group_name = "${azurerm_resource_group.example.name}"
}

resource "azurerm_template_deployment" "logic-app" {
  name                = "acctesttemplate-01"
  resource_group_name = "${azurerm_resource_group.example.name}"

  template_body = "${file("template/logic-app-template.json")}"

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = {
    "logicAppName" = "workflow1",
	"logicAppLocation" = "${azurerm_resource_group.example.location}"
  }

  deployment_mode = "Incremental"
}