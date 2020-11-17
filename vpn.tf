terraform {
  required_version = "~>0.13.0"
}

#r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN 
#r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN
#r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN #r1 VPN

resource "azurerm_subnet" "example1" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.myterraformgroup.name
  virtual_network_name = azurerm_virtual_network.TFNet1.name
  address_prefixes     = [var.vnet1_vpnsubnet_addresses]
}

resource "azurerm_public_ip" "example1" {
  name                = "r1-VPN-PIP"
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  allocation_method   = "Dynamic"
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

resource "azurerm_virtual_network_gateway" "example1" {
  name                = "r1-VPN"
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.example1.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.example1.id
  }
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

resource "azurerm_local_network_gateway" "name1" {
  name                = "Region_1_LNGW"
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  location            = var.location1
  gateway_address     = var.r1_customer_pip
  address_space       = var.r1_customer_addresses
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

resource "azurerm_virtual_network_gateway_connection" "onpremise1" {
  name                = "${var.resource_group_name}-R1-connection"
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.example1.id
  local_network_gateway_id   = azurerm_local_network_gateway.name1.id

  shared_key = var.r1_shared_key
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}