data "http" "myPublicIp" {
  url = "http://ifconfig.me/ip"
}

data "azurerm_key_vault" "mykeyvault" {
  name                = "cjpkeyvault01"
  resource_group_name = "security"
}

data "azurerm_key_vault_secret" "windowspw" {
  name         = "windowspw"
  key_vault_id = data.azurerm_key_vault.mykeyvault.id
}