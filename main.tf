#Criação de um lab com 7 servidores, os nomes as senhas entre outras oicsas podem ser alteradas, caso deseje utilizar com um número menor de VMS é necessário somente apagr as VS e os itens relacionados a ela.
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=3.6.0"
        }
    }
    backend "azurerm" {
        storage_account_name = "stateterraform001"
        container_name       = "nomedocontainer"
        key                  = "terraform.key"
        use_azuread_auth     = true
    }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "RGHA" {
  name     = "RGHA"
  location = "eastus2"
}
resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.RGHA.location
  resource_group_name = azurerm_resource_group.RGHA.name
}
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.RGHA.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_public_ip" "PIP1" {
  name                = "PIP1"
  resource_group_name = azurerm_resource_group.RGHA.name
  location            = azurerm_resource_group.RGHA.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_public_ip" "PIP2" {
  name                = "PIP2"
  resource_group_name = azurerm_resource_group.RGHA.name
  location            = azurerm_resource_group.RGHA.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_public_ip" "PIP3" {
  name                = "PIP3"
  resource_group_name = azurerm_resource_group.RGHA.name
  location            = azurerm_resource_group.RGHA.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_public_ip" "PIP4" {
  name                = "PIP4"
  resource_group_name = azurerm_resource_group.RGHA.name
  location            = azurerm_resource_group.RGHA.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_public_ip" "PIP5" {
  name                = "PIP5"
  resource_group_name = azurerm_resource_group.RGHA.name
  location            = azurerm_resource_group.RGHA.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_public_ip" "PIP6" {
  name                = "PIP6"
  resource_group_name = azurerm_resource_group.RGHA.name
  location            = azurerm_resource_group.RGHA.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_public_ip" "PIP7" {
  name                = "PIP7"
  resource_group_name = azurerm_resource_group.RGHA.name
  location            = azurerm_resource_group.RGHA.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_network_interface" "netnic" {
  name                = "${var.prefix}-netnic"
  location            = azurerm_resource_group.RGHA.location
  resource_group_name = azurerm_resource_group.RGHA.name

  ip_configuration {
    name                          = "netnic"
    primary                       = true
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.PIP1.id
  }
}
resource "azurerm_network_interface" "netnic2" {
  name                = "${var.prefix}-netnic2"
  location            = azurerm_resource_group.RGHA.location
  resource_group_name = azurerm_resource_group.RGHA.name

  ip_configuration {
    name                          = "netnic2"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.PIP2.id
  }
}
resource "azurerm_network_interface" "netnic3" {
  name                = "${var.prefix}-netnic3"
  location            = azurerm_resource_group.RGHA.location
  resource_group_name = azurerm_resource_group.RGHA.name

  ip_configuration {
    name                          = "netnic3"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.PIP3.id
  }
}
resource "azurerm_network_interface" "netnic4" {
  name                = "${var.prefix}-netnic4"
  location            = azurerm_resource_group.RGHA.location
  resource_group_name = azurerm_resource_group.RGHA.name

  ip_configuration {
    name                          = "netnic4"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.PIP4.id
  }
}
resource "azurerm_network_interface" "netnic5" {
  name                = "${var.prefix}-netnic5"
  location            = azurerm_resource_group.RGHA.location
  resource_group_name = azurerm_resource_group.RGHA.name

  ip_configuration {
    name                          = "netnic5"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.PIP5.id
  }
}
resource "azurerm_network_interface" "netnic6" {
  name                = "${var.prefix}-netnic6"
  location            = azurerm_resource_group.RGHA.location
  resource_group_name = azurerm_resource_group.RGHA.name

  ip_configuration {
    name                          = "netnic6"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.PIP6.id
  }
}
resource "azurerm_network_interface" "netnic7" {
  name                = "${var.prefix}-netnic7"
  location            = azurerm_resource_group.RGHA.location
  resource_group_name = azurerm_resource_group.RGHA.name

  ip_configuration {
    name                          = "netnic7"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.PIP7.id
  }
}
resource "azurerm_virtual_machine" "master1" {
  name                  = "${var.prefix}-master1"
  location              = azurerm_resource_group.RGHA.location
  resource_group_name   = azurerm_resource_group.RGHA.name
  network_interface_ids = [azurerm_network_interface.netnic.id]
  vm_size               = "Standard_D2_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "master1"
    admin_username = "azureuser"
    admin_password = "T&lkjsh!123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
resource "azurerm_virtual_machine" "master2" {
  name                  = "${var.prefix}-master2"
  location              = azurerm_resource_group.RGHA.location
  resource_group_name   = azurerm_resource_group.RGHA.name
  network_interface_ids = [azurerm_network_interface.netnic2.id]
  vm_size               = "Standard_D2_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  
  }
  storage_os_disk {
    name              = "myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "master2"
    admin_username = "azureuser"
    admin_password = "T&lkjsh!123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
resource "azurerm_virtual_machine" "master3" {
  name                  = "${var.prefix}-master3"
  location              = azurerm_resource_group.RGHA.location
  resource_group_name   = azurerm_resource_group.RGHA.name
  network_interface_ids = [azurerm_network_interface.netnic3.id]
  vm_size               = "Standard_D2_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  
  }
  storage_os_disk {
    name              = "myosdisk3"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "master3"
    admin_username = "azureuser"
    admin_password = "T&lkjsh!123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
resource "azurerm_virtual_machine" "worker1" {
  name                  = "${var.prefix}-worker1"
  location              = azurerm_resource_group.RGHA.location
  resource_group_name   = azurerm_resource_group.RGHA.name
  network_interface_ids = [azurerm_network_interface.netnic4.id]
  vm_size               = "Standard_D2_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
    
  }
  storage_os_disk {
    name              = "myosdisk4"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "worker1"
    admin_username = "azureuser"
    admin_password = "T&lkjsh!123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
resource "azurerm_virtual_machine" "worker2" {
  name                  = "${var.prefix}-worker2"
  location              = azurerm_resource_group.RGHA.location
  resource_group_name   = azurerm_resource_group.RGHA.name
  network_interface_ids = [azurerm_network_interface.netnic5.id]
  vm_size               = "Standard_D2_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk5"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "worker2"
    admin_username = "azureuser"
    admin_password = "T&lkjsh!123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
resource "azurerm_virtual_machine" "worker3" {
  name                  = "${var.prefix}-worker3"
  location              = azurerm_resource_group.RGHA.location
  resource_group_name   = azurerm_resource_group.RGHA.name
  network_interface_ids = [azurerm_network_interface.netnic6.id]
  vm_size               = "Standard_D2_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk6"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "worker3"
    admin_username = "azureuser"
    admin_password = "T&lkjsh!123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
resource "azurerm_virtual_machine" "haproxy" {
  name                  = "${var.prefix}-haproxy"
  location              = azurerm_resource_group.RGHA.location
  resource_group_name   = azurerm_resource_group.RGHA.name
  network_interface_ids = [azurerm_network_interface.netnic7.id]
  vm_size               = "Standard_D2_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk7"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "haproxy"
    admin_username = "azureuser"
    admin_password = "T&lkjsh!123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
