resource "azurerm_network_interface" "asg-nic" {
  for_each            = var.Network-Interface
  name                = "asg-NonProd-NIC1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}