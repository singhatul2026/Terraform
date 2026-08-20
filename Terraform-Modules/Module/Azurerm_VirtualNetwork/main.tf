resource "azurerm_virtual_network" "asg_vnet" {
  for_each            = var.Virtual_Networks
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  name                = each.value.vnet_name
  address_space       = ["10.0.0.0/16"]
}