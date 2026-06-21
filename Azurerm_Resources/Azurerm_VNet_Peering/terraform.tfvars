azurerm_resource_group_name     = "asgpeervnets-rg"
azurerm_resource_group_location = "West Europe"

azurerm_virtual_network_name = {
  vnet1 = {
    name          = "asgvnetwork1"
    address_space = ["10.0.1.0/24"]
  }

  vnet2 = {
    name          = "asgvnetwork2"
    address_space = ["10.0.2.0/24"]
  }
}

azurerm_virtual_network_peering_name = {
  peer1 = {
    name        = "asgvnetpeer1to2"
    source_vnet = "vnet1"
    remote_vnet = "vnet2"
  }

  peer2 = {
    name        = "asgvnetpeer2to1"
    source_vnet = "vnet2"
    remote_vnet = "vnet1"
  }
}