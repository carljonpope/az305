variable "address_space" {}
variable "dns_servers" {}
variable "subnets" {}
variable "nsg_rules" {
  default = {
    name = ""
    direction = ""
    access = ""
    priority = ""
    protocol = ""
    source_port_range = ""
    source_port_ranges = ""
    destination_port_range = ""
    destination_port_ranges = ""
    source_address_prefix = ""
    source_address_prefixes = ""
    destination_address_prefix = ""
    destination_address_prefixes = ""
  }
}