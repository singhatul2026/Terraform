
resource "azurerm_resource_group" "asg_rg" {
  name     = var.azurerm_resource_group_name
  location = var.azurerm_resource_group_location
}

resource "azurerm_virtual_network" "asg_vnet" {
  for_each = var.azurerm_virtual_network_name

  name                = each.value.name
  resource_group_name = azurerm_resource_group.asg_rg.name
  location            = azurerm_resource_group.asg_rg.location
  address_space       = each.value.address_space
}

resource "azurerm_virtual_network_peering" "asg_peering" {
  for_each = var.azurerm_virtual_network_peering_name

  name                      = each.value.name
  resource_group_name       = azurerm_resource_group.asg_rg.name
  virtual_network_name      = azurerm_virtual_network.asg_vnet[each.value.source_vnet].name
  remote_virtual_network_id = azurerm_virtual_network.asg_vnet[each.value.remote_vnet].id
}