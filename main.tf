locals {
  location = "uksouth"
}

module "resource_group01" {
  source   = "./modules/resourceGroup"
  name     = "az305_resource_group"
  location = local.location
}

module "vnet01" {
  source              = "./modules/virtualNetwork"
  name                = "az305_vnet01"
  location            = local.location
  resource_group_name = module.resource_group01.resource_group_name
  address_space       = var.vnet01.address_space
  dns_servers         = var.vnet01.dns_servers
}

module "subnet01" {
  source           = "./modules/subnet"
  name             = "az305_subnet01"
  rg_name          = module.resource_group01.resource_group_name
  vnet_name        = module.vnet01.vnet_name
  address_prefixes = var.subnet01_address_prefixes
}

module "nsg01" {
  source              = "./modules/nsg"
  name                = "az305_nsg01"
  location            = local.location
  resource_group_name = module.resource_group01.resource_group_name
  subnet_id           = module.subnet01.subnet_id
  nsg_id              = module.nsg01.nsg_id
}

module "nsg1_rule01" {
  source                      = "./modules/nsgRule"
  name                        = var.nsg01_rule01.name
  priority                    = var.nsg01_rule01.priority
  direction                   = var.nsg01_rule01.direction
  access                      = var.nsg01_rule01.access
  protocol                    = var.nsg01_rule01.protocol
  source_port_range           = var.nsg01_rule01.source_port_range
  destination_port_range      = var.nsg01_rule01.destination_port_range
  source_address_prefix       = var.nsg01_rule01.source_address_prefix
  destination_address_prefix  = var.nsg01_rule01.destination_address_prefix
  resource_group_name         = module.resource_group01.resource_group_name
  network_security_group_name = "az305_nsg01"

  depends_on = [
    module.nsg01
  ]
}

module "public_ip01" {
  source              = "./modules/publicIp"
  name                = "az305_public_ip01"
  location            = local.location
  resource_group_name = module.resource_group01.resource_group_name
  allocation_method   = "Dynamic"
}

module "win_vm01" {
  source                        = "./modules/windowsVm"
  nic_name                      = "az305_win_vm01_nic01"
  location                      = local.location
  resource_group_name           = module.resource_group01.resource_group_name
  ipconfig_name                 = "az305_win_vm01_nic01_config01"
  subnet_id                     = module.subnet01.subnet_id
  private_ip_address_allocation = "Dynamic"
  public_ip_address_id          = module.public_ip01.public_ip_id
  vm_name                       = "az305winvm01"
  size                          = var.win_vm01.size
  publisher                     = var.win_vm01.publisher
  offer                         = var.win_vm01.offer
  sku                           = var.win_vm01.sku
  image_version                 = var.win_vm01.image_version
  caching                       = var.win_vm01.caching
  storage_account_type          = var.win_vm01.storage_account_type
  admin_password                = data.azurerm_key_vault_secret.windowspw.value
  admin_username                = "nobodynose"
}

module "storage_account01" {
  source                   = "./modules/storageAccount"
  name                     = "az305cjpsa01"
  resource_group_name      = module.resource_group01.resource_group_name
  location                 = local.location
  account_tier             = var.storage_account01.account_tier
  account_replication_type = var.storage_account01.account_replication_type
}

module "sql_server01" {
  source                               = "./modules/azureSqlServer"
  name                                 = "az305-sqls01"
  resource_group_name                  = module.resource_group01.resource_group_name
  location                             = local.location
  sql_version                          = "12.0"
  administrator_login                  = null
  administrator_login_password         = null
  connection_policy                    = "Default"
  minimum_tls_version                  = "1.2"
  public_network_access_enabled        = true
  login_username                       = "carljonpope@hotmail.com"
  object_id                            = "9ea63675-1896-4d80-be7a-312bb3314682"
  tenant_id                            = "bc739def-cce1-4118-92dd-a6c576e267bb"
  azuread_authentication_only          = true
  identity_ids = null
  type = "SystemAssigned"
}

module "sql_db01" {
  source         = "./modules/azureSqlDatabase"
  name           = "az305_db01"
  server_id      = module.sql_server01.mssql_server_id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  read_scale     = null
  sku_name       = "Basic"
  zone_redundant = false
}