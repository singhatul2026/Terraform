Public-IPs = {
  NonProd-PublicIP1 = {
    PublicIP_name       = "asg-NonProd-PIP1"
    resource_group_name = "asg-NonProd-RG1"
    location            = "East US"
    allocation_method   = "Static"
  }

  NonProd-PublicIP2 = {
    PublicIP_name       = "asg-NonProd-PIP2"
    resource_group_name = "asg-NonProd-RG2"
    location            = "Central US"
    allocation_method   = "Static"
  }
}