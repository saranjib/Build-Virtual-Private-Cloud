variable "project_name" {
  description = "Project name"
  type        = string
  default     = "azure-vnet-project"
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "rg-azure-vnet-project"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "admin_username" {
  description = "Linux VM administrator username"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Linux VM administrator password"
  type        = string
  sensitive   = true
}
