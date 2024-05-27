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
