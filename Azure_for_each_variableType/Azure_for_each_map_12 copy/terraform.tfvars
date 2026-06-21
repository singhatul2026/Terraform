resource_group = {
  Prod_RG = {
    name       = "Prod_asinghRG"
    location   = "East US"
    managed_by = "asingh_Prod"
    Tag = {
      Environment = "Production"
      Owner       = "Atul Singh"
    }
  }

  Test_RG = {
    name       = "Test_asinghRG"
    location   = "West US"
    managed_by = "asingh_Test"
    Tag = {
      Environment = "Testing"
      Owner       = "Atul Singh"
    }
  }

  Dev_RG = {
    name       = "Dev_asinghRG"
    location   = "Central US"
    managed_by = "asingh_Test"
    Tag = {
      Environment = "Development"
      Owner       = "Atul Singh"
    }
  }
}