resource_group = {

  prod = {
    rgname     = "asg-prod-rg"
    rglocation = "East US"
    managed_by = "Terraform"

    storage = {
      storage_name = "asgprodstg001"
      account_tier = "Standard"
      replication  = "LRS"
    }
    Tag = {
      Environment = "Production"
      Owner       = "Atul Singh"
    }
  }

  dev = {
    rgname     = "asg-dev-rg"
    rglocation = "Central US"
    managed_by = "Terraform"

    storage = {
      storage_name = "asgdevstg001"
      account_tier = "Standard"
      replication  = "GRS"
    }
    Tag = {
      Environment = "Development"
      Owner       = "Atul Singh"
    }
  }
}