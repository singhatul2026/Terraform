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