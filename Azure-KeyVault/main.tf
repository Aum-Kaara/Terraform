resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-app-service-xyz01"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }
  
  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }

   identity  {
  type = "SystemAssigned"
    }
}


resource "azurerm_key_vault" "example" {
  name                        = "${azurerm_resource_group.example.name}-testvault"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  enabled_for_disk_encryption = true
  tenant_id                   = azurerm_app_service.example.identity.0.tenant_id

  sku_name = "standard"

  access_policy {
    tenant_id = azurerm_app_service.example.identity.0.tenant_id
    object_id = "679df035-c974-4a41-bafd-b46f103fbd73"
    

    key_permissions = [
      "Create","List","get","Delete"
    ]

  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_key_vault_key" "generated" {
  name         = "generated-certificate"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.example.id

  tenant_id = azurerm_app_service.example.identity.0.tenant_id
  object_id = azurerm_app_service.example.identity.0.principal_id

  key_permissions = [
    "get"
  ]
  
}