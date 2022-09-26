vnet01 = {
  address_space = ["10.2.0.0/16"]
  dns_servers   = null
}

subnet01_address_prefixes = ["10.2.1.0/24"]

nsg01_rule01 = {
  name                       = "RDP"
  priority                   = 1001
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "3389"
  source_address_prefix      = "82.31.218.251"
  destination_address_prefix = "*"
}

win_vm01 = {
  size                 = "Standard_B2s"
  publisher            = "MicrosoftWindowsServer"
  offer                = "WindowsServer"
  sku                  = "2016-datacenter-gensecond"
  image_version        = "latest"
  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"
}

storage_account01 = {
  account_tier             = "Standard"
  account_replication_type = "LRS"
}