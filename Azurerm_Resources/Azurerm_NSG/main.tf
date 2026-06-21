resource "azurerm_resource_group" "asg-rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_network_security_group" "asg-nsg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.asg-rg.location
  resource_group_name = azurerm_resource_group.asg-rg.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
