vnet1 = {
  address_space = ["10.2.0.0/16"]
  dns_servers   = null
}

subnet1_address_prefixes = ["10.2.1.0/254"]

nsg1_rule1 = {
    name                       = "RDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "82.12.247.77"
    destination_address_prefix = "*"
}