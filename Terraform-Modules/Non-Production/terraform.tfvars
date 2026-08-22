Resource_Groups = {
  NonProd_RG1 = {
    resource_group_name = "asg-NonProd-RG1"
    location            = "East US"
    managed_by          = "Terraform"
    tags = {
      environment = "non-prod"
      owner       = "atul_singh"
    }
  }

  NonProd_RG2 = {
    resource_group_name = "asg-NonProd-RG2"
    location            = "Central US"
    managed_by          = "Terraform"
    tags = {
      environment = "non-prod"
      owner       = "atul_singh"
    }
  }
    NonProd_RG3 = {
    resource_group_name = "asg-NonProd-RG3"
    location            = "Central US"
    managed_by          = "Terraform"
    tags = {
      environment = "non-prod"
      owner       = "atul_singh"
    }
  }
}

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

network_interfaces = {
  NonProdNIC1 = {
    nic_name             = "asg-NonProd-NIC1"
    location             = "East US"
    resource_group_name  = "asg-NonProd-RG1"
    virtual_network_name = "asg-NonProd-VNet1"
    subnet_name          = "asg-NonProd-Subnet1"
  }

  NonProdNIC2 = {
    nic_name             = "asg-NonProd-NIC2"
    location             = "Central US"
    resource_group_name  = "asg-NonProd-RG2"
    virtual_network_name = "asg-NonProd-VNet2"
    subnet_name          = "asg-NonProd-Subnet2"
  }
}

virtual_machines = {
  NonProdVM1 = {
    name                = "asg-NonProd-VM1"
    resource_group_name = "asg-NonProd-RG1"
    location            = "East US"
    size                = "Standard_D4_v5"
    admin_username      = "adminuser"
    admin_password      = "Password1234!"
    nic_name            = "asg-NonProd-NIC1"
  }

  NonProdVM2 = {
    name                = "asg-NonProd-VM2"
    resource_group_name = "asg-NonProd-RG2"
    location            = "Central US"
    size                = "Standard_D4_v5"
    admin_username      = "adminuser"
    admin_password      = "Password1234!"
    nic_name            = "asg-NonProd-NIC2"
  }
}
