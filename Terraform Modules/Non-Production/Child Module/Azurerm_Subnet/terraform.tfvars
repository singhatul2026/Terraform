subnets = {
  NonProdSubnet1 = {
    subnet_name          = "asg-Nonprod-Subnet1"
    resource_group_name  = "asg-Nonprod-RG1"
    virtual_network_name = "asg-Nonprod-VNet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  NonProdSubnet2 = {
    subnet_name          = "asg-Nonprod-Subnet2"
    resource_group_name  = "asg-Nonprod-RG2"
    virtual_network_name = "asg-Nonprod-VNet2"
    address_prefixes     = ["10.0.1.0/24"]
  }

}