resource "azurerm_resource_group" "asg-rg" {
  name     = var.azurerm_resource_group_name
  location = var.azurerm_resource_group_location
}

resource "azurerm_public_ip" "asg-pip" {
  name                = var.azurerm_public_ip_name
  resource_group_name = azurerm_resource_group.asg-rg.name
  location            = azurerm_resource_group.asg-rg.location
  allocation_method   = "Static"
}