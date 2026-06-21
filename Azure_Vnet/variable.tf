
variable "asg_vnet" {
  description = "Map of all environment configurations"
  type = map(object({
    resource_group_name = string
    location            = string
    vnet_name           = string
    vnet_address_space  = list(string)
    tags                = map(string)
  }))
}