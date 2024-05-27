# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnets
resource "azurerm_subnet" "web" {
  name                 = var.web_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.web_subnet_prefixes
}

resource "azurerm_subnet" "app" {
  name                 = var.app_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.app_subnet_prefixes
}

resource "azurerm_subnet" "db" {
  name                 = var.db_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.db_subnet_prefixes
}

# Network Security Groups
resource "azurerm_network_security_group" "web_nsg" {
  name                = var.web_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_group" "app_nsg" {
  name                = var.app_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_group" "db_nsg" {
  name                = var.db_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Network Security Rules
resource "azurerm_network_security_rule" "web_allow_http" {
  resource_group_name = azurerm_resource_group.rg.name
  name                        = var.web_allow_http_rule_name
  priority                    = var.web_allow_http_rule_priority
  direction                   = var.web_allow_http_rule_direction
  access                      = var.web_allow_http_rule_access
  protocol                    = var.web_allow_http_rule_protocol
  source_port_range           = var.web_allow_http_rule_source_port_range
  destination_port_range      = var.web_allow_http_rule_destination_port_range
  source_address_prefix       = var.web_allow_http_rule_source_address_prefix
  destination_address_prefix  = var.web_allow_http_rule_destination_address_prefix
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

resource "azurerm_network_security_rule" "web_allow_https" {
  resource_group_name = azurerm_resource_group.rg.name
  name                        = var.web_allow_https_rule_name
  priority                    = var.web_allow_https_rule_priority
  direction                   = var.web_allow_https_rule_direction
  access                      = var.web_allow_https_rule_access
  protocol                    = var.web_allow_https_rule_protocol
  source_port_range           = var.web_allow_https_rule_source_port_range
  destination_port_range      = var.web_allow_https_rule_destination_port_range
  source_address_prefix       = var.web_allow_https_rule_source_address_prefix
  destination_address_prefix  = var.web_allow_https_rule_destination_address_prefix
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

resource "azurerm_network_security_rule" "app_allow_inbound" {
  resource_group_name = azurerm_resource_group.rg.name
  name                        = var.app_allow_inbound_rule_name
  priority                    = var.app_allow_inbound_rule_priority
  direction                   = var.app_allow_inbound_rule_direction
  access                      = var.app_allow_inbound_rule_access
  protocol                    = var.app_allow_inbound_rule_protocol
  source_port_range           = var.app_allow_inbound_rule_source_port_range
  destination_port_range      = var.app_allow_inbound_rule_destination_port_range
  source_address_prefix       = var.app_allow_inbound_rule_source_address_prefix
  destination_address_prefix  = var.app_allow_inbound_rule_destination_address_prefix
  network_security_group_name = azurerm_network_security_group.app_nsg.name
}

resource "azurerm_network_security_rule" "db_allow_inbound" {
  resource_group_name = azurerm_resource_group.rg.name
  name                        = var.db_allow_inbound_rule_name
  priority                    = var.db_allow_inbound_rule_priority
  direction                   = var.db_allow_inbound_rule_direction
  access                      = var.db_allow_inbound_rule_access
  protocol                    = var.db_allow_inbound_rule_protocol
  source_port_range           = var.db_allow_inbound_rule_source_port_range
  destination_port_range      = var.db_allow_inbound_rule_destination_port_range
  source_address_prefix       = var.db_allow_inbound_rule_source_address_prefix
  destination_address_prefix  = var.db_allow_inbound_rule_destination_address_prefix
  network_security_group_name = azurerm_network_security_group.db_nsg.name
}

# Subnet Associations with NSGs
resource "azurerm_subnet_network_security_group_association" "web_assoc" {
  subnet_id                 = azurerm_subnet.web.id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "app_assoc" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "db_assoc" {
  subnet_id                 = azurerm_subnet.db.id
  network_security_group_id = azurerm_network_security_group.db_nsg.id
}

# Web Tier Virtual Machine
resource "azurerm_linux_virtual_machine" "web_vm" {
  name                = var.web_vm_name
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
  name                = var.app_vm_name
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

# Database Tier - Azure Database for MySQL
resource "azurerm_mysql_server" "mysql" {
  name                = var.mysql_server_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  administrator_login = var.admin_username_db
  administrator_login_password = var.admin_password_db
  sku_name            = var.mysql_server_sku_name
  storage_mb          = var.mysql_server_storage_mb
  version             = var.mysql_server_version
  auto_grow_enabled   = var.mysql_server_auto_grow_enabled
  backup_retention_days = var.mysql_server_backup_retention_days
  geo_redundant_backup_enabled = var.mysql_server_geo_redundant_backup_enabled
  public_network_access_enabled = var.mysql_server_public_network_access_enabled
  ssl_enforcement_enabled       = var.mysql_server_ssl_enforcement_enabled
}

resource "azurerm_mysql_database" "exampledb" {
  name                = var.mysql_database_name
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = var.mysql_database_charset
  collation           = var.mysql_database_collation
}

# Output the Public IP of the Web VM
output "web_vm_public_ip" {
  value = azurerm_linux_virtual_machine.web_vm.public_ip_address
}
