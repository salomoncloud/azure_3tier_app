module "three_tier_app" {
  source              = "./threetierwebapp/"
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  db_admin_username   = var.admin_username_db
  db_admin_password   = var.admin_password_db
}

output "module_web_vm_public_ip" {
  value = module.three_tier_app.module_web_vm_public_ip
}
