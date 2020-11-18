terraform {
  required_version = "~>0.13.0"
}

# SQL Server and DB REGION 1 # SQL Server and DB REGION 1 # SQL Server and DB REGION 1 # SQL Server and DB REGION 1 
resource "azurerm_sql_server" "name" {
  name                         = var.sqlserver
  resource_group_name          = azurerm_resource_group.myterraformgroup.name
  location                     = var.location1
  version                      = "12.0"
  administrator_login          = var.sqladminuser
  administrator_login_password = var.sqladminpass

  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

resource "azurerm_sql_database" "name" {
  name                = "MFPSecure"
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  location            = var.location1
  server_name         = azurerm_sql_server.name.name
  edition             = "Basic"
  /*
  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }
*/
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}
