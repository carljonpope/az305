address_space = ["10.2.0.0/16"]
dns_servers   = null
subnets = {
  1 = { name = "compute", address_prefix = "10.2.0.0/24", security_group = null }
  2 = { name = "database", address_prefix = "10.2.1.0/24", security_group = null }
  3 = { name = "app_services", address_prefix = "10.2.2.0/24", security_group = null }
}
nsg_rules = {
  rule01 = {
    name                       = "RDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "82.12.247.77" #"${local.ifconfig_co_json.ip}/32"
    destination_address_prefix = "*"
  }
}