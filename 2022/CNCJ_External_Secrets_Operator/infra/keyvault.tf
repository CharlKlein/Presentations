// Create a Resource Group
resource "azurerm_resource_group" "keyvault_rg" {
  name     = "eso-keyvault-rg"
  location = var.azure_region
}

// Create a Key Vault
resource "azurerm_key_vault" "eso-keyvault" {
  name                        = format("%s-%s", "eso-demo-keyvault", random_id.app_bytes.hex)
  location                    = azurerm_resource_group.keyvault_rg.location
  resource_group_name         = azurerm_resource_group.keyvault_rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false
  enabled_for_disk_encryption = false

  sku_name = "standard"

  access_policy = [{
    # Grant Ourself Full Access
    tenant_id      = data.azurerm_client_config.current.tenant_id
    object_id      = data.azurerm_client_config.current.object_id
    application_id = null

    key_permissions = [
      "Backup", "Create", "Decrypt", "Delete", "Encrypt",
      "Get", "Import", "List", "Purge", "Recover", "Restore",
      "Sign", "UnwrapKey", "Update", "Verify", "WrapKey"
    ]

    secret_permissions = [
      "Backup", "Delete", "Get", "List", "Purge",
      "Recover", "Restore", "Set",
    ]

    storage_permissions = [
      "Backup", "Delete", "DeleteSAS", "Get", "GetSAS",
      "List", "ListSAS", "Purge", "Recover", "RegenerateKey",
      "Restore", "Set", "SetSAS", "Update",
    ]

    certificate_permissions = [
      "Backup", "Create", "Delete", "DeleteIssuers",
      "Get", "GetIssuers", "Import", "List", "ListIssuers",
      "ManageContacts", "ManageIssuers", "Purge", "Recover",
      "Restore", "SetIssuers", "Update",
    ]
    },
    {
      #Grant SP access to the keyvault
      tenant_id      = data.azurerm_client_config.current.tenant_id
      object_id      = azuread_service_principal.eso_sp.id
      application_id = null

      key_permissions = [
        "Get", "List",
      ]

      secret_permissions = [
        "Get", "List",
      ]

      certificate_permissions = []
      storage_permissions     = []
  }]

  depends_on = [
    azuread_service_principal.eso_sp
  ]
}


