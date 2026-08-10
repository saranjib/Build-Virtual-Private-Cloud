
# Create a resource group
resource "azurerm_resource_group" "rg-azure-vnet-project" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "azure-vnet-project-law" {
  name                = "${var.project_name}-law"
  location            = azurerm_resource_group.rg-azure-vnet-project.location
  resource_group_name = azurerm_resource_group.rg-azure-vnet-project.name

  sku               = "PerGB2018"
  retention_in_days = 30

 
}
