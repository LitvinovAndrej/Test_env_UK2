terraform {
  required_version = "~>0.13.0"
}

# VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 # VM1 REGION 1 

#PIP for VM1 R1
resource "azurerm_public_ip" "name1" {
  name                = "${var.vm1_r1_hostname}-PIP"
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = var.vm1_r1_pip_dns_lable
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

# NIC for VM1 R1
resource "azurerm_network_interface" "name1" {
  name                = "${var.vm1_r1_hostname}-NIC"
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  dns_servers         = var.r1_dns_domain_controller

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.tfsubnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.name1.id
  }
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

# VM1 R1 Creation
resource "azurerm_virtual_machine" "name1" {
  name                             = var.vm1_r1_hostname
  location                         = var.location1
  resource_group_name              = azurerm_resource_group.myterraformgroup.name
  network_interface_ids            = [azurerm_network_interface.name1.id]
  vm_size                          = var.vm1_r1_size
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vm1_r1_hostname}-osdisk"
    disk_size_gb      = "128"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm1_r1_hostname
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
    timezone                  = var.r1_timezone
  }
  /*
  boot_diagnostics {
    enabled = "false"
    # storage_uri = azurerm_storage_account.storageacc.primary_blob_endpoint
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

# VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  # VM 2 REGION 1  

#PIP for VM2 R1
resource "azurerm_public_ip" "name2" {
  name                = "${var.vm2_r1_hostname}-PIP"
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = var.vm2_r1_pip_dns_lable
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

# NIC for VM2 R1
resource "azurerm_network_interface" "name2" {
  name                = "${var.vm2_r1_hostname}-NIC"
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  dns_servers         = var.r1_dns_domain_controller

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.tfsubnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.name2.id
  }
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

# VM 2 R1 Creation
resource "azurerm_virtual_machine" "name2" {
  name                             = var.vm2_r1_hostname
  location                         = var.location1
  resource_group_name              = azurerm_resource_group.myterraformgroup.name
  network_interface_ids            = [azurerm_network_interface.name2.id]
  vm_size                          = var.vm2_r1_size
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vm2_r1_hostname}-osdisk"
    disk_size_gb      = "128"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm2_r1_hostname
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
    timezone                  = var.r1_timezone
  }
  /*
  boot_diagnostics {
    enabled = "false"
    # storage_uri = azurerm_storage_account.storageacc.primary_blob_endpoint
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
