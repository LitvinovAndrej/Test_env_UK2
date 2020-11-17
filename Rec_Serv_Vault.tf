terraform {
  required_version = "~>0.13.0"
}

resource "azurerm_recovery_services_vault" "rec_serv_vault1" {
  name                = var.recovery_vault_name
  location            = var.location1
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  sku                 = "Standard"
  tags = {
    CreatedBy       = var.CreatedBy
    ManagedServices = var.ManagedServices
    EnvironmentType = var.EnvironmentType
    ResourceOwner   = var.ResourceOwner
    ManagedServices = var.ManagedServices
  }
}

resource "azurerm_backup_policy_vm" "rec_serv_policy1" {
  name                = "rec_serv_policy1"
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  recovery_vault_name = azurerm_recovery_services_vault.rec_serv_vault1.name

  timezone = "UTC"

  backup {
    frequency = "Weekly"
    weekdays  = ["Saturday"]
    time      = "09:00"
  }
/*
  retention_daily {
    count = 10
  }
*/
  retention_weekly {
    count    = 10
    weekdays = ["Saturday"]
  }

/*
  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }

  retention_yearly {
    count    = 77
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }
*/
}

#ASSIGNING VMs TO RECOVERY SERVICE VAULT #ASSIGNING VMs TO RECOVERY SERVICE VAULT #ASSIGNING VMs TO RECOVERY SERVICE VAULT #ASSIGNING VMs TO RECOVERY SERVICE VAULT #ASSIGNING VMs TO RECOVERY SERVICE VAULT 

resource "azurerm_backup_protected_vm" "vm1_r1" {
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  recovery_vault_name = azurerm_recovery_services_vault.rec_serv_vault1.name
  source_vm_id        = azurerm_virtual_machine.name1.id
  backup_policy_id    = azurerm_backup_policy_vm.rec_serv_policy1.id
}
resource "azurerm_backup_protected_vm" "vm2_r1" {
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  recovery_vault_name = azurerm_recovery_services_vault.rec_serv_vault1.name
  source_vm_id        = azurerm_virtual_machine.name2.id
  backup_policy_id    = azurerm_backup_policy_vm.rec_serv_policy1.id
}