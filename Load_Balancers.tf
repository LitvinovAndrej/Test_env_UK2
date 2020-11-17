terraform {
  required_version = "~>0.13.0"
}

# R1 LOAD BALANCER  # R1 LOAD BALANCER  # R1 LOAD BALANCER  # R1 LOAD BALANCER  # R1 LOAD BALANCER  # R1 LOAD BALANCER  # R1 LOAD BALANCER  # R1 LOAD BALANCER  # R1 LOAD BALANCER  
#PIP for R1 LB
resource "azurerm_public_ip" "name7" {
  name                = "r1-lb-pip"
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = var.r1_LB_pip_dns_lable
}

#LB Region 1
resource "azurerm_lb" "name1" {
  name                = "r1-LB"
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "r1-Frontend"
    public_ip_address_id = azurerm_public_ip.name7.id
  }
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}
#LB Backend Pool
resource "azurerm_lb_backend_address_pool" "bp1" {
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  loadbalancer_id     = azurerm_lb.name1.id
  name                = "BackEndAddressPool"
}

# Association VM NICs to LB Backend Pool
resource "azurerm_network_interface_backend_address_pool_association" "nicassocvm1r1" {
  network_interface_id    = azurerm_network_interface.name1.id
  ip_configuration_name   = "ipconfig1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bp1.id
}
resource "azurerm_network_interface_backend_address_pool_association" "nicassocvm2r1" {
  network_interface_id    = azurerm_network_interface.name2.id
  ip_configuration_name   = "ipconfig1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bp1.id
}

# LB Rule
resource "azurerm_lb_rule" "rule1" {
  resource_group_name            = azurerm_resource_group.myterraformgroup.name
  loadbalancer_id                = azurerm_lb.name1.id
  name                           = "LBRule1"
  protocol                       = "Tcp"
  frontend_ip_configuration_name = "r1-Frontend"
  frontend_port                  = 5555
  backend_port                   = 5555
  backend_address_pool_id        = azurerm_lb_backend_address_pool.bp1.id
  probe_id                       = azurerm_lb_probe.probe1.id
  #depends_on                     = ["azurerm_lb_probe.probe1"]
}

#LB Probe
resource "azurerm_lb_probe" "probe1" {
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  loadbalancer_id     = azurerm_lb.name1.id
  name                = "probe1"
  protocol            = "Tcp"
  port                = 5555
  interval_in_seconds = "5"
  number_of_probes    = "2"
}