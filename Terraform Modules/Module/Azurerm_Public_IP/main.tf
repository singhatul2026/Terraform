resource "azurerm_public_ip" "asg-pip" {
  for_each            = var.Public-IPs
  name                = each.value.PublicIP_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}