locals {
  location = "uksouth"
}

module "resource_group1" {
  source   = "./modules/resourceGroup"
  name     = "az305_resource_group"
  location = local.location
}

module "vnet1" {
  source              = "./modules/virtualNetwork"
  name                = "az305_vnet1"
  location            = local.location
  resource_group_name = module.resource_group1.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  subnets             = var.subnets
}

module "nsg1" {
  source = "./modules/network_security_group"
  name = "az305_nsg1"
  location= local.location
  resource_group_name = module.resource_group1.resource_group_name
  nsg_rules = var.nsg_rules
}

module "public_ip1" {
  source = "./modules/publicIp"
  name = "az305_public_ip1"
location = local.location
resource_group_name = module.resource_group1.resource_group_name
allocation_method = "Dynamic"
}
/*
resource "azurerm_subnet_network_security_group_association" "associate" {
    subnet_id = data.azurerm_subnet.snet[each.key].id
    network_security_group_id = azurerm_network_security_group.nsg.id
}
*/