address_space = ["10.2.0.0/16"]
dns_servers   = null
subnets = {
  1 = { name = "compute", address_prefix = "10.2.0.0/24", security_group = null }
  2 = { name = "database", address_prefix = "10.2.1.0/24", security_group = null }
  3 = { name = "app_services", address_prefix = "10.2.2.0/24", security_group = null }
}
