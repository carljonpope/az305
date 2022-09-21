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
  address_space       = var.vnet1.address_space
  dns_servers         = var.vnet1.dns_servers
}

module "subnet1" {
  name             = "az305_subnet1"
  rg_name          = module.resource_group1.resource_group_name
  vnet_name        = module.vnet1.vnet_name
  address_prefixes = var.subnet1_address_prefixes
}

module "nsg1" {
  source              = "./modules/network_security_group"
  name                = "az305_nsg1"
  location            = local.location
  resource_group_name = module.resource_group1.resource_group_name
  subnet_id           = module.subnet1.id
  nsg_id              = module.nsg1.id
}

module "nsg1_rule1" {
  name                        = var.nsg1_rule1.name
  priority                    = var.nsg1_rule1.priority
  direction                   = var.nsg1_rule1.direction
  access                      = var.nsg1_rule1.access
  protocol                    = var.nsg1_rule1.protocol
  source_port_range           = var.nsg1_rule1.source_port_range
  destination_port_range      = var.nsg1_rule1.destination_port_range
  source_address_prefix       = var.nsg1_rule1.source_address_prefix
  destination_address_prefix  = var.nsg1_rule1.destination_address_prefix
  resource_group_name         = module.resource_group1.resource_group_name
  network_security_group_name = "az305_nsg1"
}

module "public_ip1" {
  source              = "./modules/publicIp"
  name                = "az305_public_ip1"
  location            = local.location
  resource_group_name = module.resource_group1.resource_group_name
  allocation_method   = "Dynamic"
}
