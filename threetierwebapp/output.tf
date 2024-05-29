# Output the Public IP of the Web VM
output "web_vm_public_ip" {
  count               = var.vm_count
  value = azurerm_linux_virtual_machine.web_vm.public_ip_address[count.index]
}

output "module_web_vm_public_ip" {
  count               = var.vm_count
  description = "The public IP address of the web VM"
  value       = azurerm_linux_virtual_machine.web_vm.public_ip_address[count.index]
}
