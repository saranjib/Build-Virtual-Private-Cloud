# This creates Blob Storage and a private endpoint inside the private subnet.
# =========================================================
# RANDOM STORAGE ACCOUNT SUFFIX
# =========================================================

resource "random_string" "storage_suffix" {
  length  = 8

  special = false
  upper   = false
  numeric = true
}

# =========================================================
# STORAGE ACCOUNT
# =========================================================

resource "azurerm_storage_account" "storage" {
  # Truncate project_name to 8 characters using substr() to ensure total length <= 24
  name = "st${substr(lower(replace(var.project_name, "-", "")), 0, 8)}${random_string.storage_suffix.result}"
  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name
  location            = azurerm_resource_group.rg-azure-vnet-project.location

  account_kind = "StorageV2"

  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version = "TLS1_2"

  public_network_access_enabled = false

  }

# ---------------------------------------------------------
# BLOB CONTAINER
# ---------------------------------------------------------

resource "azurerm_storage_container" "project" {
  name                  = "project-data"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}


# =========================================================
# PRIVATE DNS ZONE
# =========================================================

resource "azurerm_private_dns_zone" "blob" {
  name = "privatelink.blob.core.windows.net"

  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name
}

# =========================================================
# PRIVATE DNS VNET LINK
# =========================================================

resource "azurerm_private_dns_zone_virtual_network_link" "blob" {
  name = "blob-dns-link"

  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name

  private_dns_zone_name = azurerm_private_dns_zone.blob.name

  virtual_network_id = azurerm_virtual_network.vnet1.id
}

# =========================================================
# BLOB PRIVATE ENDPOINT
# =========================================================

resource "azurerm_private_endpoint" "blob" {
  name = "pe-blob-storage"

  location = azurerm_resource_group.rg-azure-vnet-project.location
  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name

  subnet_id = azurerm_subnet.private.id

  private_service_connection {
    name = "blob-private-connection"

    private_connection_resource_id = azurerm_storage_account.storage.id

    is_manual_connection = false

    subresource_names = [
      "blob"
    ]
  }

  private_dns_zone_group {
    name = "blob-dns-zone-group"

    private_dns_zone_ids = [
      azurerm_private_dns_zone.blob.id
    ]
  }
}
