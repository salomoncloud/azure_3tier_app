# Web Tier Virtual Machine
resource "azurerm_linux_virtual_machine" "web_vm" {
  name                = "webVM"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.web_vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.web_nic.id,
  ]
  os_disk {
    caching              = var.web_vm_os_disk_caching
    storage_account_type = var.web_vm_os_disk_storage_account_type
  }
  source_image_reference {
    publisher = var.web_vm_source_image_publisher
    offer     = var.web_vm_source_image_offer
    sku       = var.web_vm_source_image_sku
    version   = var.web_vm_source_image_version
  }
}

resource "azurerm_network_interface" "web_nic" {
  name                = var.web_nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = var.web_nic_ip_configuration_name
    subnet_id                     = azurerm_subnet.web.id
    private_ip_address_allocation = var.web_nic_ip_allocation
  }
}

# App Tier Virtual Machine
resource "azurerm_linux_virtual_machine" "app_vm" {
  name                = "appVM"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.app_vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.app_nic.id,
  ]
  os_disk {
    caching              = var.app_vm_os_disk_caching
    storage_account_type = var.app_vm_os_disk_storage_account_type
  }
  source_image_reference {
    publisher = var.app_vm_source_image_publisher
    offer     = var.app_vm_source_image_offer
    sku       = var.app_vm_source_image_sku
    version   = var.app_vm_source_image_version
  }
}

resource "azurerm_network_interface" "app_nic" {
  name                = var.app_nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = var.app_nic_ip_configuration_name
    subnet_id                     = azurerm_subnet.app.id
    private_ip_address_allocation = var.app_nic_ip_allocation
  }
}
