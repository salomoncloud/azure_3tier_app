subscription_id = "your_subscription_id"
client_id = "your_client_id"
client_secret = "your_client_secret"
tenant_id = "your_tenant_id"
admin_username = "your_admin_username"
admin_password = "your_admin_password"
admin_username_db = "your_admin_username_db"
admin_password_db = "your_admin_password_db"

resource_group_name = "Mcitterraformrg"
location = "Canada Central"

vnet_name = "myVNet"
vnet_address_space = ["10.0.0.0/16"]

web_subnet_name = "web-subnet"
web_subnet_prefixes = ["10.0.1.0/24"]

app_subnet_name = "app-subnet"
app_subnet_prefixes = ["10.0.2.0/24"]

db_subnet_name = "db-subnet"
db_subnet_prefixes = ["10.0.3.0/24"]

web_nsg_name = "web-nsg"
app_nsg_name = "app-nsg"
db_nsg_name = "db-nsg"

web_allow_http_rule_name = "allow-http"
web_allow_http_rule_priority = 100
web_allow_http_rule_direction = "Inbound"
web_allow_http_rule_access = "Allow"
web_allow_http_rule_protocol = "Tcp"
web_allow_http_rule_source_port_range = "*"
web_allow_http_rule_destination_port_range = "80"
web_allow_http_rule_source_address_prefix = "*"
web_allow_http_rule_destination_address_prefix = "*"

web_allow_https_rule_name = "allow-https"
web_allow_https_rule_priority = 101
web_allow_https_rule_direction = "Inbound"
web_allow_https_rule_access = "Allow"
web_allow_https_rule_protocol = "Tcp"
web_allow_https_rule_source_port_range = "*"
web_allow_https_rule_destination_port_range = "443"
web_allow_https_rule_source_address_prefix = "*"
web_allow_https_rule_destination_address_prefix = "*"

app_allow_inbound_rule_name = "allow-inbound"
app_allow_inbound_rule_priority = 100
app_allow_inbound_rule_direction = "Inbound"
app_allow_inbound_rule_access = "Allow"
app_allow_inbound_rule_protocol = "Tcp"
app_allow_inbound_rule_source_port_range = "*"
app_allow_inbound_rule_destination_port_range = "8080"
app_allow_inbound_rule_source_address_prefix = "10.0.1.0/24"
app_allow_inbound_rule_destination_address_prefix = "10.0.2.0/24"

db_allow_inbound_rule_name = "allow-inbound-db"
db_allow_inbound_rule_priority = 100
db_allow_inbound_rule_direction = "Inbound"
db_allow_inbound_rule_access = "Allow"
db_allow_inbound_rule_protocol = "Tcp"
db_allow_inbound_rule_source_port_range = "*"
db_allow_inbound_rule_destination_port_range = "3306"
db_allow_inbound_rule_source_address_prefix = "10.0.2.0/24"
db_allow_inbound_rule_destination_address_prefix = "10.0.3.0/24"

web_vm_name = "webVM"
web_vm_size = "Standard_B1s"
web_vm_os_disk_caching = "ReadWrite"
web_vm_os_disk_storage_account_type = "Standard_LRS"
web_vm_source_image_publisher = "Canonical"
web_vm_source_image_offer = "UbuntuServer"
web_vm_source_image_sku = "18.04-LTS"
web_vm_source_image_version = "latest"

web_nic_name = "webNIC"
web_nic_ip_configuration_name = "internal"
web_nic_ip_allocation = "Dynamic"

app_vm_name = "appVM"
app_vm_size = "Standard_B1s"
app_vm_os_disk_caching = "ReadWrite"
app_vm_os_disk_storage_account_type = "Standard_LRS"
app_vm_source_image_publisher = "Canonical"
app_vm_source_image_offer = "UbuntuServer"
app_vm_source_image_sku = "18.04-LTS"
app_vm_source_image_version = "latest"

app_nic_name = "appNIC"
app_nic_ip_configuration_name = "internal"
app_nic_ip_allocation = "Dynamic"

mysql_server_name = "mysqlserver"
mysql_server_sku_name = "GP_Gen5_2"
mysql_server_storage_mb = 5120
mysql_server_version = "5.7"
mysql_server_auto_grow_enabled = true
mysql_server_backup_retention_days = 7
mysql_server_geo_redundant_backup_enabled = false
mysql_server_public_network_access_enabled = false
mysql_server_ssl_enforcement_enabled = true

mysql_database_name = "exampledb"
mysql_database_charset = "utf8"
mysql_database_collation = "utf8_general_ci"

