output "public_ip_name" {
  value = azurerm_public_ip.asg-pip.name
}
output "public_ip_id" {
  value = azurerm_public_ip.asg-pip.id
}
output "public_ip_address" {
  value = azurerm_public_ip.asg-pip.ip_address
}
