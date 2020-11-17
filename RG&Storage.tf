terraform {
  required_version = "~>0.13.0"
}
provider "azurerm" {
  version = ">=2.10.0"
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

# RESOURCE GROUP CREATION # RESOURCE GROUP CREATION # RESOURCE GROUP CREATION # RESOURCE GROUP CREATION # RESOURCE GROUP CREATION # RESOURCE GROUP CREATION # RESOURCE GROUP CREATION # RESOURCE GROUP CREATION 
resource "azurerm_resource_group" "myterraformgroup" {
  name     = var.resource_group_name
  location = var.location1

  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

# Storage Account # Storage Account # Storage Account # Storage Account # Storage Account # Storage Account # Storage Account # Storage Account # Storage Account # Storage Account 
resource "azurerm_storage_account" "storageacc" {
  name                     = var.storage_acc_name
  resource_group_name      = azurerm_resource_group.myterraformgroup.name
  location                 = var.location1
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}
