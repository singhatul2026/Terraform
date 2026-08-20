subnets = {
  NonProdSubnet1 = {
    subnet_name          = "asg-NonProd-Subnet1"
    resource_group_name  = "asg-NonProd-RG1"
    virtual_network_name = "asg-NonProd-VNet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  NonProdSubnet2 = {
    subnet_name          = "asg-NonProd-Subnet2"
    resource_group_name  = "asg-NonProd-RG2"
    virtual_network_name = "asg-NonProd-VNet2"
    address_prefixes     = ["10.0.1.0/24"]
  }

}