variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "admin_password_db" {
  type = string
}

variable "admin_username_db" {
  type = string
}

variable "resource_group_name" {
  type = string
  default = "Mcitterraformrg"
}

variable "location" {
  type = string
  default = "Canada Central"
}

variable "vnet_name" {
  type = string
  default = "myVNet"
}

variable "vnet_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "web_subnet_name" {
  type = string
  default = "web-subnet"
}

variable "web_subnet_prefixes" {
  type = list(string)
  default = ["10.0.1.0/24"]
}

variable "app_subnet_name" {
  type = string
  default = "app-subnet"
}

variable "app_subnet_prefixes" {
  type = list(string)
  default = ["10.0.2.0/24"]
}

variable "db_subnet_name" {
  type = string
  default = "db-subnet"
}

variable "db_subnet_prefixes" {
  type = list(string)
  default = ["10.0.3.0/24"]
}

variable "web_nsg_name" {
  type = string
  default = "web-nsg"
}

variable "app_nsg_name" {
  type = string
  default = "app-nsg"
}

variable "db_nsg_name" {
  type = string
  default = "db-nsg"
}

variable "web_allow_http_rule_name" {
  type = string
  default = "allow-http"
}

variable "web_allow_http_rule_priority" {
  type = number
  default = 100
}

variable "web_allow_http_rule_direction" {
  type = string
  default = "Inbound"
}

variable "web_allow_http_rule_access" {
  type = string
  default = "Allow"
}

variable "web_allow_http_rule_protocol" {
  type = string
  default = "Tcp"
}

variable "web_allow_http_rule_source_port_range" {
  type = string
  default = "*"
}

variable "web_allow_http_rule_destination_port_range" {
  type = string
  default = "80"
}

variable "web_allow_http_rule_source_address_prefix" {
  type = string
  default = "*"
}

variable "web_allow_http_rule_destination_address_prefix" {
  type = string
  default = "*"
}

variable "web_allow_https_rule_name" {
  type = string
  default = "allow-https"
}

variable "web_allow_https_rule_priority" {
  type = number
  default = 101
}

variable "web_allow_https_rule_direction" {
  type = string
  default = "Inbound"
}

variable "web_allow_https_rule_access" {
  type = string
  default = "Allow"
}

variable "web_allow_https_rule_protocol" {
  type = string
  default = "Tcp"
}

variable "web_allow_https_rule_source_port_range" {
  type = string
  default = "*"
}

variable "web_allow_https_rule_destination_port_range" {
  type = string
  default = "443"
}

variable "web_allow_https_rule_source_address_prefix" {
  type = string
  default = "*"
}

variable "web_allow_https_rule_destination_address_prefix" {
  type = string
  default = "*"
}

variable "app_allow_inbound_rule_name" {
  type = string
  default = "allow-inbound"
}

variable "app_allow_inbound_rule_priority" {
  type = number
  default = 100
}

variable "app_allow_inbound_rule_direction" {
  type = string
  default = "Inbound"
}

variable "app_allow_inbound_rule_access" {
  type = string
  default = "Allow"
}

variable "app_allow_inbound_rule_protocol" {
  type = string
  default = "Tcp"
}

variable "app_allow_inbound_rule_source_port_range" {
  type = string
  default = "*"
}

variable "app_allow_inbound_rule_destination_port_range" {
  type = string
  default = "8080"
}

variable "app_allow_inbound_rule_source_address_prefix" {
  type = string
  default = "10.0.1.0/24"
}

variable "app_allow_inbound_rule_destination_address_prefix" {
  type = string
  default = "10.0.2.0/24"
}

variable "db_allow_inbound_rule_name" {
  type = string
  default = "allow-inbound-db"
}

variable "db_allow_inbound_rule_priority" {
  type = number
  default = 100
}

variable "db_allow_inbound_rule_direction" {
  type = string
  default = "Inbound"
}

variable "db_allow_inbound_rule_access" {
  type = string
  default = "Allow"
}

variable "db_allow_inbound_rule_protocol" {
  type = string
  default = "Tcp"
}

variable "db_allow_inbound_rule_source_port_range" {
  type = string
  default = "*"
}

variable "db_allow_inbound_rule_destination_port_range" {
  type = string
  default = "3306"
}

variable "db_allow_inbound_rule_source_address_prefix" {
  type = string
  default = "10.0.2.0/24"
}

variable "db_allow_inbound_rule_destination_address_prefix" {
  type = string
  default = "10.0.3.0/24"
}

variable "web_vm_name" {
  type = string
  default = "webVM"
}

variable "web_vm_size" {
  type = string
  default = "Standard_B1s"
}

variable "web_vm_os_disk_caching" {
  type = string
  default = "ReadWrite"
}

variable "web_vm_os_disk_storage_account_type" {
  type = string
  default = "Standard_LRS"
}

variable "web_vm_source_image_publisher" {
  type = string
  default = "Canonical"
}

variable "web_vm_source_image_offer" {
  type = string
  default = "UbuntuServer"
}

variable "web_vm_source_image_sku" {
  type = string
  default = "18.04-LTS"
}

variable "web_vm_source_image_version" {
  type = string
  default = "latest"
}

variable "web_nic_name" {
  type = string
  default = "webNIC"
}

variable "web_nic_ip_configuration_name" {
  type = string
  default = "internal"
}

variable "web_nic_ip_allocation" {
  type = string
  default = "Dynamic"
}

variable "app_vm_name" {
  type = string
  default = "appVM"
}

variable "app_vm_size" {
  type = string
  default = "Standard_B1s"
}

variable "app_vm_os_disk_caching" {
  type = string
  default = "ReadWrite"
}

variable "app_vm_os_disk_storage_account_type" {
  type = string
  default = "Standard_LRS"
}

variable "app_vm_source_image_publisher" {
  type = string
  default = "Canonical"
}

variable "app_vm_source_image_offer" {
  type = string
  default = "UbuntuServer"
}

variable "app_vm_source_image_sku" {
  type = string
  default = "18.04-LTS"
}

variable "app_vm_source_image_version" {
  type = string
  default = "latest"
}

variable "app_nic_name" {
  type = string
  default = "appNIC"
}

variable "app_nic_ip_configuration_name" {
  type = string
  default = "internal"
}

variable "app_nic_ip_allocation" {
  type = string
  default = "Dynamic"
}

variable "mysql_server_name" {
  type = string
  default = "mysqlserver"
}

variable "mysql_server_sku_name" {
  type = string
  default = "GP_Gen5_2"
}

variable "mysql_server_storage_mb" {
  type = number
  default = 5120
}

variable "mysql_server_version" {
  type = string
  default = "5.7"
}

variable "mysql_server_auto_grow_enabled" {
  type = bool
  default = true
}

variable "mysql_server_backup_retention_days" {
  type = number
  default = 7
}

variable "mysql_server_geo_redundant_backup_enabled" {
  type = bool
  default = false
}

variable "mysql_server_public_network_access_enabled" {
  type = bool
  default = false
}

variable "mysql_server_ssl_enforcement_enabled" {
  type = bool
  default = true
}

variable "mysql_database_name" {
  type = string
  default = "exampledb"
}

variable "mysql_database_charset" {
  type = string
  default = "utf8"
}

variable "mysql_database_collation" {
  type = string
  default = "utf8_general_ci"
}
