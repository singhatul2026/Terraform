resource "azurerm_resource_group" "asg-rg" {
  name     = var.resource_group_name
  location = var.resource_location
}

resource "azurerm_virtual_network" "asg-vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.asg-rg.location
  resource_group_name = azurerm_resource_group.asg-rg.name
}