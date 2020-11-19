terraform {
  required_version = "~>0.13.0"
}

resource "azurerm_recovery_services_vault" "rec_serv_vault1" {
  name                = var.recovery_vault_name
  location            = azurerm_resource_group.myterraformgroup.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  soft_delete_enabled = false
  sku                 = "Standard"

  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

resource "azurerm_backup_policy_vm" "recoverypolicy1" {
  name                           = "rec-serv-policy1"
  resource_group_name            = azurerm_resource_group.myterraformgroup.name
  recovery_vault_name            = azurerm_recovery_services_vault.rec_serv_vault1.name
  instant_restore_retention_days = "5"
  timezone                       = "UTC"

  backup {
    frequency = "Weekly"
    weekdays  = ["Friday"]
    time      = "23:00"
  }
  
  retention_weekly {
    count    = "5"
    weekdays = ["Friday"]
  } 
}

#ASSIGNING VMs TO RECOVERY SERVICE VAULT #ASSIGNING VMs TO RECOVERY SERVICE VAULT #ASSIGNING VMs TO RECOVERY SERVICE VAULT #ASSIGNING VMs TO RECOVERY SERVICE VAULT #ASSIGNING VMs TO RECOVERY SERVICE VAULT 

resource "azurerm_backup_protected_vm" "vm1_r1" {
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  recovery_vault_name = azurerm_recovery_services_vault.rec_serv_vault1.name
  source_vm_id        = azurerm_virtual_machine.name1.id
  backup_policy_id    = azurerm_backup_policy_vm.recoverypolicy1.id
}
resource "azurerm_backup_protected_vm" "vm2_r1" {
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  recovery_vault_name = azurerm_recovery_services_vault.rec_serv_vault1.name
  source_vm_id        = azurerm_virtual_machine.name2.id
  backup_policy_id    = azurerm_backup_policy_vm.recoverypolicy1.id
}
