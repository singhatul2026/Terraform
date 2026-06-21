
resource "azurerm_resource_group" "asg_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "asg_vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.asg_rg.location
  resource_group_name = azurerm_resource_group.asg_rg.name
}

resource "azurerm_subnet" "asg_subnet" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = azurerm_resource_group.asg_rg.name
  virtual_network_name = azurerm_virtual_network.asg_vnet.name
  address_prefixes     = each.value.address_prefixes
}