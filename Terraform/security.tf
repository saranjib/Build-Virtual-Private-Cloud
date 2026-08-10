# =========================================================
# PRIVATE SUBNET NSG
# =========================================================

resource "azurerm_network_security_group" "private" {
  name                = "nsg-private-subnet"
  location            = azurerm_resource_group.rg-azure-vnet-project.location
  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name

  # Allow SSH from Virtual Network
  security_rule {
    name                       = "Allow-SSH-VNet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"

    source_port_range          = "*"
    destination_port_range     = "22"

    source_address_prefix     = "VirtualNetwork"
    destination_address_prefix = "*"
  }

  # Allow ICMP from Virtual Network
  security_rule {
    name                       = "Allow-ICMP-VNet"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"

    source_port_range          = "*"
    destination_port_range     = "*"

    source_address_prefix     = "VirtualNetwork"
    destination_address_prefix = "*"
  }

 }

# =========================================================
# PRIVATE SUBNET NSG ASSOCIATION
# =========================================================

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.private.id
}

# =========================================================
# PUBLIC SUBNET NSG
# =========================================================

resource "azurerm_network_security_group" "public" {
  name                = "nsg-public-subnet"
  location            = azurerm_resource_group.rg-azure-vnet-project.location
  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name


  # Allow HTTP
  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"

    source_port_range          = "*"
    destination_port_range     = "80"

    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  # Allow HTTPS
  security_rule {
    name                       = "Allow-HTTPS"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"

    source_port_range          = "*"
    destination_port_range     = "443"

    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

 }

# =========================================================
# PUBLIC SUBNET NSG ASSOCIATION
# =========================================================

resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.public.id
}
