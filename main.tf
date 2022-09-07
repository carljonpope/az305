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

module "public_ip1" {
  source = "./modules/publicIp"
  name = "az305_public_ip1"
location = local.location
resource_group_name = module.resource_group1.resource_group_name
allocation_method = "dynamic"
}

