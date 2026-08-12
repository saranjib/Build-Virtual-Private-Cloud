# =========================================================
# RESOURCE GROUP OUTPUTS
# =========================================================

output "resource_group_name" {
  description = "The name of the created resource group"
  value       = azurerm_resource_group.rg-azure-vnet-project.name
}

output "location" {
  description = "The Azure region where resources are created"
  value       = azurerm_resource_group.rg-azure-vnet-project.location
}

# =========================================================
# VNET 1 OUTPUTS
# =========================================================

output "vnet1_name" {
  description = "The name of Virtual Network 1"
  value       = azurerm_virtual_network.vnet1.name
}

output "vnet1_address_space" {
  description = "The address space of Virtual Network 1"
  value       = azurerm_virtual_network.vnet1.address_space
}

# =========================================================
# VNET 2 OUTPUTS
# =========================================================

output "vnet2_name" {
  description = "The name of Virtual Network 2"
  value       = azurerm_virtual_network.vnet2.name
}

output "vnet2_address_space" {
  description = "The address space of Virtual Network 2"
  value       = azurerm_virtual_network.vnet2.address_space
}

# =========================================================
# SUBNET OUTPUTS
# =========================================================

output "public_subnet_name" {
  description = "The name of the public subnet"
  value       = azurerm_subnet.public.name
}

output "private_subnet_id" {
  description = "The ID of the private subnet in VNET 1"
  value       = azurerm_subnet.private.id
}


output "vnet2_private_subnet_id" {
  description = "The ID of the private subnet in VNET 2"
  value       = azurerm_subnet.vnet2_private.id
}

output "vnet2_private_subnet_name" {
  description = "The name of the private subnet in VNET 2"
  value       = azurerm_subnet.vnet2_private.name
}


# =========================================================
# PRIVATE VM OUTPUTS
# =========================================================


output "private_vm_name" {
  description = "The name of the private Linux virtual machine"
  value       = azurerm_linux_virtual_machine.private_vm.name
}

output "private_vm_nic_id" {
  description = "The ID of the network interface card for the private VM"
  value       = azurerm_network_interface.private_vm.id
}

output "private_vm_nic_name" {
  description = "The name of the network interface card for the private VM"
  value       = azurerm_network_interface.private_vm.name
}

output "private_vm_private_ip" {
  description = "The private IP address of the private VM"
  value       = azurerm_network_interface.private_vm.private_ip_address
}

# =========================================================
# STORAGE ACCOUNT OUTPUTS
# =========================================================

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.storage.name
}


output "storage_container_name" {
  description = "The name of the blob storage container"
  value       = azurerm_storage_container.project.name
}

# =========================================================
# PRIVATE ENDPOINT OUTPUTS
# =========================================================

output "blob_private_endpoint_name" {
  description = "The name of the blob storage private endpoint"
  value       = azurerm_private_endpoint.blob.name
}

# =========================================================
# PRIVATE DNS ZONE OUTPUTS
# =========================================================


output "private_dns_zone_name" {
  description = "The name of the private DNS zone"
  value       = azurerm_private_dns_zone.blob.name
}

# =========================================================
# NETWORK SECURITY GROUP OUTPUTS
# =========================================================

output "private_nsg_name" {
  description = "The name of the private subnet Network Security Group"
  value       = azurerm_network_security_group.private.name
}


output "public_nsg_name" {
  description = "The name of the public subnet Network Security Group"
  value       = azurerm_network_security_group.public.name
}

# =========================================================
# VNET PEERING OUTPUTS
# =========================================================

output "vnet1_to_vnet2_peering_name" {
  description = "The name of the peering from VNET 1 to VNET 2"
  value       = azurerm_virtual_network_peering.vnet1_to_vnet2.name
}

output "vnet2_to_vnet1_peering_name" {
  description = "The name of the peering from VNET 2 to VNET 1"
  value       = azurerm_virtual_network_peering.vnet2_to_vnet1.name
}

# =========================================================
# MONITORING OUTPUTS
# =========================================================

output "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.azure-vnet-project-law.name
}

output "network_watcher_name" {
  description = "The name of the Network Watcher"
  value       = azurerm_network_watcher.azure-vnet-project-nw.name
}
