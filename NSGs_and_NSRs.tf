terraform {
  required_version = "~>0.13.0"
}
# REGION 1 NSG and NSR`s # REGION 1 NSG and NSR`s # REGION 1 NSG and NSR`s # REGION 1 NSG and NSR`s # REGION 1 NSG and NSR`s # REGION 1 NSG and NSR`s # REGION 1 NSG and NSR`s # REGION 1 NSG and NSR`s 
resource "azurerm_network_security_group" "fullnsg1" {
  name                = "${var.resource_group_name}-R1-NSG"
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

#INBOUND #INBOUND #INBOUND #INBOUND #INBOUND #INBOUND #INBOUND #INBOUND #INBOUND #INBOUND #INBOUND #INBOUND 
resource "azurerm_network_security_rule" "r1nsr1" {
  name                        = "rdp"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myterraformgroup.name
  network_security_group_name = azurerm_network_security_group.fullnsg1.name
}

resource "azurerm_network_security_rule" "r1nsr2" {
  name                        = "Web80"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myterraformgroup.name
  network_security_group_name = azurerm_network_security_group.fullnsg1.name
}

resource "azurerm_network_security_rule" "r1nsr3" {
  name                        = "VPSX_Inbound"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["515", "631", "9443", "5500", "5501", "5601", "25"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myterraformgroup.name
  network_security_group_name = azurerm_network_security_group.fullnsg1.name
}

resource "azurerm_network_security_rule" "r1nsr4" {
  name                        = "MFPSecure_Inbound"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myterraformgroup.name
  network_security_group_name = azurerm_network_security_group.fullnsg1.name
}
resource "azurerm_network_security_rule" "r1nsr5" {
  name                        = "AlertX_Inbound"
  priority                    = 104
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["5555", "5556", "5557"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myterraformgroup.name
  network_security_group_name = azurerm_network_security_group.fullnsg1.name
}
resource "azurerm_network_security_rule" "r1nsr6" {
  name                        = "Innovate_Audit_Inbound"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "5703"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myterraformgroup.name
  network_security_group_name = azurerm_network_security_group.fullnsg1.name
}

#OUTBOUND #OUTBOUND #OUTBOUND #OUTBOUND #OUTBOUND #OUTBOUND #OUTBOUND #OUTBOUND #OUTBOUND #OUTBOUND #OUTBOUND 
resource "azurerm_network_security_rule" "r1nsr21" {
  name                        = "80Out"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "80"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myterraformgroup.name
  network_security_group_name = azurerm_network_security_group.fullnsg1.name
}
resource "azurerm_network_security_rule" "r1nsr22" {
  name                        = "VPSX_Outbound"
  priority                    = 101
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["161", "515", "631", "5600", "5703", "7501", "9100", "443", "9443", "5600", "25", "53"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myterraformgroup.name
  network_security_group_name = azurerm_network_security_group.fullnsg1.name
}
resource "azurerm_network_security_rule" "r1nsr23" {
  name                        = "LRSQ_Outbound"
  priority                    = 102
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "5500"
  destination_port_range      = "5500"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myterraformgroup.name
  network_security_group_name = azurerm_network_security_group.fullnsg1.name
}