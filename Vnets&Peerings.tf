terraform {
  required_version = "~>0.13.0"
}

# Vnet REGION 1  # Vnet REGION 1  # Vnet REGION 1  # Vnet REGION 1  # Vnet REGION 1  # Vnet REGION 1  # Vnet REGION 1  # Vnet REGION 1  # Vnet REGION 1  # Vnet REGION 1  # Vnet REGION 1  
resource "azurerm_virtual_network" "TFNet1" {
  name                = var.vnet1_name
  address_space       = var.vnet1_address_space
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

# subnet for VNET 1
resource "azurerm_subnet" "tfsubnet1" {
  name                 = "${var.vnet1_name}-subnet"
  resource_group_name  = azurerm_resource_group.myterraformgroup.name
  virtual_network_name = azurerm_virtual_network.TFNet1.name
  address_prefixes     = [var.vnet1_subnetnet_addresses]
}

resource "azurerm_subnet_network_security_group_association" "nsg1totfsubnet1" {
  subnet_id                 = azurerm_subnet.tfsubnet1.id
  network_security_group_id = azurerm_network_security_group.fullnsg1.id
}