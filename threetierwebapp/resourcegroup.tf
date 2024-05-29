# Resource Group
resource "azurerm_resource_group" "rg" {
  count = var.vm_count
  name     = var.resource_group_name
  location = var.location
}
