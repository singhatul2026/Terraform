variable "environments" {
  default = {
    dev = {
      location = "eastus"
      tags = {
        environment = "dev"
        owner       = "dev-team"
      }
    }
    test = {
      location = "westus"
      tags = {
        environment = "test"
        owner       = "qa-team"
      }
    }
    prod = {
      location = "centralus"
      tags = {
        environment = "prod"
        owner       = "ops-team"
        critical    = "true"
      }
    }
  }
}