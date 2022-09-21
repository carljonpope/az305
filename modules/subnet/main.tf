resource "azurerm_subnet" "example" {
  name                 = var.name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes

  delegation {
    name = "delegation"

    service_delegation {
      name    = var.delegation_name
      actions = var.delegation_actions
    }
  }
}