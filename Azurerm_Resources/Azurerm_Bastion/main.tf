resource "azurerm_resource_group" "asg_rg" {
  name       = var.rg_name
  location   = var.location
  managed_by = var.managed_by
}

resource "azurerm_virtual_network" "asg_Vnet" {
  name                = "asg_azure_Vnet"
  address_space       = ["192.168.1.0/24"]
  location            = azurerm_resource_group.asg_rg.location
  resource_group_name = azurerm_resource_group.asg_rg.name
}

resource "azurerm_subnet" "asg_subnet" {
  name                 = "asg_AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.asg_rg.name
  virtual_network_name = azurerm_virtual_network.asg_Vnet.name
  address_prefixes     = ["192.168.1.224/27"]
}

resource "azurerm_public_ip" "asg_public_ip" {
  name                = "asg_pip"
  location            = azurerm_resource_group.asg_rg.location
  resource_group_name = azurerm_resource_group.asg_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "asg_bastionHost" {
  name                = "asg_bastion"
  location            = azurerm_resource_group.asg_rg.location
  resource_group_name = azurerm_resource_group.asg_rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.asg_subnet.id
    public_ip_address_id = azurerm_public_ip.asg_public_ip.id
  }
}