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