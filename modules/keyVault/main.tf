resource "azurerm_key_vault" "example" {
  name                        = "az305cjpkeyvault"
  location                    = local.location
  resource_group_name         = module.resource_group1.resource_group_name
  enabled_for_disk_encryption = false
  tenant_id                   = "bc739def-cce1-4118-92dd-a6c576e267bb"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  network_acls {
    bypass                     = "None"
    default_action             = "Deny"
    ip_rules                   = [data.http.myPublicIp.response_body]
    virtual_network_subnet_ids = null
  }
}
