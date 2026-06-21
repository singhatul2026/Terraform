resource "azurerm_resource_group" "asg-rg" {
  name     = var.azurerm_resource_group_name
  location = var.azurerm_resource_group_location
}

resource "azurerm_virtual_network" "asg-vnet" {
  name                = "asg-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.asg-rg.location
  resource_group_name = azurerm_resource_group.asg-rg.name
}

resource "azurerm_subnet" "asg-subnet" {
  name                 = "asg-internal"
  resource_group_name  = azurerm_resource_group.asg-rg.name
  virtual_network_name = azurerm_virtual_network.asg-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "asg-nic" {
  name                = "asg-nic"
  location            = azurerm_resource_group.asg-rg.location
  resource_group_name = azurerm_resource_group.asg-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.asg-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "asg-vm" {
  name                  = "example-machine"
  resource_group_name   = azurerm_resource_group.asg-rg.name
  location              = azurerm_resource_group.asg-rg.location
  size                  = "Standard_F2"
  admin_username        = "adminuser"
  network_interface_ids = [cazurerm_network_interface.asg-nic.id, ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}