resource "azurerm_network_interface" "cjptest_vm01_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ipconfig_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "cjptest_vm01" {
  name                             = var.vm_name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  network_interface_ids            = var.nic_id
  vm_size                          = var.vm_size
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  storage_image_reference          = var.storage_image_reference
  storage_os_disk                  = var.storage_os_disk
  os_profile                       = var.os_profile
  os_profile_windows_config        = var.os_profile_windows_config
}