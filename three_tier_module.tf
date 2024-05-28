module "three_tier_app" {
  source              = "./threetierwebapp/"
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  admin_username_db  = var.admin_username_db
  admin_password_db   = var.admin_password_db
}

output "module_web_vm_public_ip" {
  value = module.three_tier_app.module_web_vm_public_ip
}
