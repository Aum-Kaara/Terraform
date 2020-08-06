
data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "example" {
  name                        = "dev-key-vault-testing"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"
}

resource "azurerm_key_vault_access_policy" "Octopus_policy" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  certificate_permissions = [
      "create","delete","get","import","list"
    ]
     secret_permissions = [
      "List","get","Delete","set"
    ]
     key_permissions = [
      "Create","List","get","Delete"
    ]
  
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
   depends_on = [azurerm_key_vault_access_policy.Octopus_policy]
}

resource "azurerm_key_vault_secret" "secret" {
  name         = "Test"
  value        = "Test"
  key_vault_id = azurerm_key_vault.example.id
  depends_on = [azurerm_key_vault_access_policy.Octopus_policy]
    
}

resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.example.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = var.object_id

  key_permissions = [
    "get"
  ]
  
}