# Output the Public IP of the Web VM
output "web_vm_public_ip" {
  vm_count = 7
  value = azurerm_linux_virtual_machine.web_vm.public_ip_address
}

output "module_web_vm_public_ip" {
  vm_count = 7
  description = "The public IP address of the web VM"
  value       = azurerm_linux_virtual_machine.web_vm.public_ip_address
}
