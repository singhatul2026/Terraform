data "azurerm_subnet" "asg_subnets" {
  for_each = var.network_interfaces

  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}


resource "azurerm_network_interface" "asg_nic" {
  for_each = var.network_interfaces

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.asg_subnets[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}