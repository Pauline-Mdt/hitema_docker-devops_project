output "vm_public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "vm_username" {
  value = azurerm_linux_virtual_machine.main.admin_username
}