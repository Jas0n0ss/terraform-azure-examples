output "resource_group_name" {
  value = azurerm_resource_group.main.name
}
output "computer_name" {
  value = azurerm_linux_virtual_machine.main.computer_name
}
output "admin_username" {
  value = azurerm_linux_virtual_machine.main.admin_username
}
output "public_ip_address" {
  value = azurerm_linux_virtual_machine.main.public_ip_address
}
output "admin_ssh_key" {
  value = azurerm_linux_virtual_machine.main.admin_ssh_key
}