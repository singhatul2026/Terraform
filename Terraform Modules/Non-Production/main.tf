module "resource_group" {
  source = "../Child Module/Azurerm_ResourceGroup"
  Resource_Groups = var.Resource_Groups
}

module "virtual_network" {
  source = "../Child Module/Azurerm_VirtualNetwork"
  Virtual_Networks = var.Virtual_Networks
  depends_on = [module.resource_group]
}

module "subnet" {
  source = "../Child Module/Azurerm_Subnet"
  subnets = var.subnets
  depends_on = [module.virtual_network]
}

module "public_ip" {
  source = "../Child Module/Azurerm_Public_IP"
  Public-IPs = var.Public-IPs
  depends_on = [module.resource_group]
}   

module "network_interface" {
  source = "../Child Module/Azurerm_NetworkInterface"
  network_interfaces = var.network_interfaces
  depends_on = [module.subnet]
}

module "virtual_machine" {
  source = "../Child Module/Azurerm_VirtualMachine"
  virtual_machines = var.virtual_machines
    depends_on = [module.network_interface]
}
