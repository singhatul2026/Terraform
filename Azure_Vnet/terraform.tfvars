# terraform.tfvars
asg_vnet = {
  dev = {
    resource_group_name = "rg-dev"
    location            = "East US"
    vnet_name           = "vnet-dev"
    vnet_address_space  = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
      managed_by  = "terraform"
    }
  }
  prod = {
    resource_group_name = "rg-prod"
    location            = "Central US"
    vnet_name           = "vnet-prod"
    vnet_address_space  = ["10.1.0.0/16"]
    tags = {
      environment = "prod"
      managed_by  = "terraform"
    }
  }
}