resource "azurerm_resource_group" "asg_rg" {
  for_each = var.asg_vnet
  name     = each.value.resource_group_name
  location = each.value.location
  tags     = each.value.tags
}


resource "azurerm_virtual_network" "asg_vnet" {
  for_each            = var.asg_vnet
  resource_group_name = azurerm_resource_group.asg_rg[each.key].name
  location            = azurerm_resource_group.asg_rg[each.key].location
  name                = each.value.vnet_name
  address_space       = each.value.vnet_address_space
  tags                = each.value.tags
}


