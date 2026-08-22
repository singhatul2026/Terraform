
variable "Resource_Groups" {
  description = "Resource Group configuration"
  type        = map(any)
}

variable "Virtual_Networks" {
  description = "Virtual Network configuration"
  type        = map(any)
}

variable "subnets" {
  description = "Subnet configuration"
  type        = map(any)
}

variable "Public-IPs" {
  description = "Public IP configuration"
  type        = map(any)
}

variable "network_interfaces" {
  description = "Network Interface configuration"
  type        = map(any)
}

variable "virtual_machines" {
  description = "Virtual Machine configuration"
  type        = map(any)
}