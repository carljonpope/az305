resource "azurerm_network_security_group" "network_security_group" {
  name                = var.name
  location            = var.name
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
    network_security_group_name = each.value["network_security_group_name"]
    depends_on = [
        azurerm_network_security_group.nsgcreation
    ]
}