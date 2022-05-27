# Use the Current subscription
data "azurerm_subscription" "primary" {}

# Use the Current local azure cilent config
data "azurerm_client_config" "current" {}

# Subnet for the aks cluster 
data "azurerm_subnet" "sn2" {
  name                 = "sn2"
  virtual_network_name = azurerm_virtual_network.aks_nw.name
  resource_group_name  = azurerm_resource_group.network_rg.name
}

resource "random_id" "app_bytes" {
  # Generate a new id for each deployment
  byte_length = 2
}