# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}_resources"
  location = var.location
}

# Create a virtual network
resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}_network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = var.environnement
  }
}

resource "azurerm_ssh_public_key" "main" {
  name                = "main"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  public_key          = file(var.path_to_ssh_key)
}

# Create a public ip address
resource "azurerm_public_ip" "pip" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"

  tags = {
    environment = var.environnement
  }
}

# Create virtual machine
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}_nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                = "${var.prefix}_vm"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B1s"
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.path_to_ssh_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }

}

output "vm_public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "vm_username" {
  value = azurerm_linux_virtual_machine.main.admin_username
}

#resource "azurerm_network_interface" "main" {
#  name                = "${var.prefix}-nic1"
#  resource_group_name = azurerm_resource_group.main.name
#  location            = azurerm_resource_group.main.location
#
#  ip_configuration {
#    name                          = "primary"
#    subnet_id                     = azurerm_subnet.internal.id
#    private_ip_address_allocation = "Dynamic"
#    public_ip_address_id          = azurerm_public_ip.pip.id
#  }
#}
#
#resource "azurerm_network_interface" "internal" {
#  name                      = "${var.prefix}-nic2"
#  resource_group_name       = azurerm_resource_group.main.name
#  location                  = azurerm_resource_group.main.location
#
#  ip_configuration {
#    name                          = "internal"
#    subnet_id                     = azurerm_subnet.internal.id
#    private_ip_address_allocation = "Dynamic"
#  }
#}
#
#resource "azurerm_network_security_group" "webserver" {
#  name                = "tls_webserver"
#  location            = azurerm_resource_group.main.location
#  resource_group_name = azurerm_resource_group.main.name
#  security_rule {
#    access                     = "Allow"
#    direction                  = "Inbound"
#    name                       = "tls"
#    priority                   = 100
#    protocol                   = "Tcp"
#    source_port_range          = "*"
#    source_address_prefix      = "*"
#    destination_port_range     = "443"
#    destination_address_prefix = azurerm_network_interface.main.private_ip_address
#  }
#}
#
#resource "azurerm_network_interface_security_group_association" "main" {
#  network_interface_id      = azurerm_network_interface.internal.id
#  network_security_group_id = azurerm_network_security_group.webserver.id
#}
#
#resource "azurerm_linux_virtual_machine" "main" {
#  name                            = "${var.prefix}-vm"
#  resource_group_name             = azurerm_resource_group.main.name
#  location                        = azurerm_resource_group.main.location
#  size                            = "Standard_F2"
#  admin_username                  = "adminuser"
#  admin_password                  = "P@ssw0rd1234!"
#  disable_password_authentication = false
#  network_interface_ids = [
#    azurerm_network_interface.main.id,
#    azurerm_network_interface.internal.id,
#  ]
#
#  source_image_reference {
#    publisher = "Canonical"
#    offer     = "UbuntuServer"
#    sku       = "16.04-LTS"
#    version   = "latest"
#  }
#
#  os_disk {
#    storage_account_type = "Standard_LRS"
#    caching              = "ReadWrite"
#  }
#}