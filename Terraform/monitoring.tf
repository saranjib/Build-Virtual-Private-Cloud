# =========================================================
# NETWORK WATCHER
# =========================================================

resource "azurerm_network_watcher" "azure-vnet-project-nw" {
  name                = "network-watcher-project"
  location            = azurerm_resource_group.rg-azure-vnet-project.location
  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name

  
}

# =========================================================
# VNET DIAGNOSTIC SETTINGS
# =========================================================

resource "azurerm_monitor_diagnostic_setting" "vnet" {
  name                       = "vnet-diag"
  target_resource_id         = azurerm_virtual_network.vnet1.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.azure-vnet-project-law.id

  enabled_metric {
    category = "AllMetrics"
    # Note: 'enabled' is no longer required or used inside enabled_metric 
    # because the block's presence itself enables it.
  }
}
