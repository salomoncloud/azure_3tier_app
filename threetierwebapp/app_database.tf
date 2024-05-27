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
