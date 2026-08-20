Virtual_Networks = {
  NonProd_VNet1 = {
    resource_group_name = "asg-NonProd-RG1"
    location            = "East US"
    vnet_name           = "asg-NonProd-VNet1"
    vnet_address_space  = ["10.0.0.0/16"]
  }

  NonProd_VNet2 = {
    resource_group_name = "asg-NonProd-RG2"
    location            = "Central US"
    vnet_name           = "asg-NonProd-VNet2"
    vnet_address_space  = ["10.1.0.0/16"]
  }
}

