
# Create a Secret in Azure Key Vault
resource "azurerm_key_vault_secret" "demo_secret" {
  name         = "eso-demo-secret"
  value        = "Hello CNCJ - This Is A Secret From Azure Key Vault !"
  key_vault_id = azurerm_key_vault.eso-keyvault.id

  depends_on = [
    azurerm_key_vault.eso-keyvault
  ]
}