resource "azurerm_network_security_group" "nsg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "nsgrules" {
    for_each = var.nsg_rules
    name = each.value["name"]
    direction = each.value["direction"]
    access = each.value["access"]
    priority = each.value["priority"]
    protocol = each.value["protocol"]
    source_port_ranges = lookup(each.value, "source_port_ranges", null)
    source_port_range = lookup(each.value, "source_port_range", null)
    destination_port_ranges = lookup(each.value, "destination_port_ranges", null)
    destination_port_range = lookup(each.value, "destination_port_range", null)
    source_address_prefixes = lookup(each.value, "source_address_prefixes", null)
    source_address_prefix = lookup(each.value, "source_address_prefix", null)
    destination_address_prefixes = lookup(each.value, "destination_address_prefixes", null)
    destination_address_prefix = lookup(each.value, "destination_address_prefix", null)
    resource_group_name = var.resource_group_name
    network_security_group_name = azurerm_network_security_group.nsg.name
}
/*
resource "azurerm_subnet_network_security_group_association" "associate" {
    subnet_id = data.azurerm_subnet.snet[each.key].id
    network_security_group_id = azurerm_network_security_group.nsg.id
}
*/