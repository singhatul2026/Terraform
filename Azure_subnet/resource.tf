resource "azurerm_resource_group" "asg-rg" {
name =
location =
managed_by =  
tag = 
}

resource "azurerm_virtual_network" " asg-Vnet" {
  name                = "example-vnet"
  resource_group_name = 
  location            = 
  address_space       = 
}

resoource "azurerm_subnet" "asg-subnet" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.asg-rg.name
  virtual_network_name = azurerm_virtual_network.asg-Vnet.name
  address_prefixes     = ["

