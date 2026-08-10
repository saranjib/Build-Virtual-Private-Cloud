# =========================================================
# PRIVATE VM NIC - VNET 1
# =========================================================

resource "azurerm_network_interface" "private_vm" {
  name                = "nic-private-vm"
  location            = azurerm_resource_group.rg-azure-vnet-project.location
  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.private.id
    private_ip_address_allocation = "Dynamic"
  }

  }

# =========================================================
# PRIVATE LINUX VM - VNET 1
# =========================================================

resource "azurerm_linux_virtual_machine" "private_vm" {
  name                = "vm-private"
  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name
  location            = azurerm_resource_group.rg-azure-vnet-project.location

  size = "Standard_B1s"

  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.private_vm.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  
}

# =========================================================
# VNET 2 VM NIC
# =========================================================

resource "azurerm_network_interface" "vnet2_vm" {
  name                = "nic-vnet2-vm"
  location            = azurerm_resource_group.rg-azure-vnet-project.location
  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vnet2_private.id
    private_ip_address_allocation = "Dynamic"
  }

 }

# =========================================================
# VNET 2 LINUX VM
# =========================================================

resource "azurerm_linux_virtual_machine" "vnet2_vm" {
  name                = "vm-vnet2"
  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name
  location            = azurerm_resource_group.rg-azure-vnet-project.location

  size = "Standard_B1s"

  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.vnet2_vm.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

 }
