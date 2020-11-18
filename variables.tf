#Content:
#Azure ID`s
#Names
#TAGS
#Resource Group, location
#Networking: 
#   VNET REGION1
#   VNET REGION2
#   VNET REGION3
#VPN r1
#VPN r2
#VPN r3
#Recovery Services Vault
#VM
#VM SIZE
#Storage Accounts
#SQL server/database
#OTHERS

#Azure ID`s:
variable "subscription_id" {
  description = "Please enter the SUBSCRIPTION ID for Azure in which you are planning to deploy in"
}
variable "tenant_id" {
  description = "Please enter the TENANT ID for Azure in which you are planning to deploy in"
}
variable "client_id" {
  description = "Please enter the CLIENT ID for Azure Service Principal Account"
}
variable "client_secret" {
  description = "Please enter the SECRET for Azure Service Principal Account"
}

# Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names # Names 

variable "prefix1" {
  description = "The prefix, which can be put before every name to select your resource from the list"
  default     = "lrs"
}

variable "prefix2" {
  description = "The prefix, which can be put before every name to select your resource from the list"
  default     = "lrs2"
}

variable "prefix3" {
  description = "The prefix, which can be put before every name to select your resource from the list"
  default     = "lrs3"
}

#TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS #TAGS 

variable "CreatedBy" {
  default = "LRS Managed Services Team"
}

variable "EnvironmentType" {
  default = "LRS Managed Services Test Environment"
}

variable "ResourceOwner" {
  description = "Please enter Resource Owner Name"
}

variable "ManagedServices" {
  default = "Yes"
}

#Resource group, location #Resource group, location #Resource group, location #Resource group, location #Resource group, location #Resource group, location #Resource group, location #Resource group, location #Resource group, location #Resource group, location
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default     = "LRS_MS-TEST"
}

variable "location1" {
  description = "The location/region where the virtual network is created."
  default     = "centralus"
}

variable "location2" {
  description = "The location where the secondary resources will be created."
  default     = "West Europe"
}

variable "location3" {
  description = "The location where the third resources will be created."
  default     = "centralus"
}

#Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking #Networking 

#VNET REGION1 
variable "vnet1_name" {
  default = "VNET1"
}
variable "vnet1_address_space" {
  default = ["10.1.0.0/16"]
}
variable "vnet1_subnetnet_addresses" {
  default = ["10.1.1.0/24"]
}
variable "bastion_r1_subnet" {
  default = ["10.1.2.0/30"]
}
variable "r1_LB_pip_dns_lable" {
  default = "r1vpsx"
}
variable "vm1_r1_pip_dns_lable" {
  default = "vm1reg1"
}
variable "vm2_r1_pip_dns_lable" {
  default = "vm2reg1"
}
variable "r1_dns_domain_controller" {
  description = "Please enter the Domain Controller IP address in customer`s on-premise network"
}

#VNET REGION 2
variable "vnet2_name" {
  default = "VNET2"
}
variable "vnet2_address_space" {
  default = ["10.2.0.0/16"]
}
variable "vnet2_subnetnet_addresses" {
  default = ["10.2.1.0/24"]
}
variable "bastion_r2_subnet" {
  default = ["10.2.2.0/30"]
}
variable "r2_LB_pip_dns_lable" {
  default = "r2vpsx"
}
variable "vm1_r2_pip_dns_lable" {
  default = "vm1reg2"
}
variable "vm2_r2_pip_dns_lable" {
  default = "vm2reg2"
}

#VNET REGION 3
variable "vnet3_name" {
  default = "VNET3"
}
variable "vnet3_address_space" {
  default = ["10.3.0.0/16"]
}
variable "vnet3_subnetnet_addresses" {
  default = ["10.3.1.0/24"]
}
variable "bastion_r3_subnet" {
  default = ["10.3.2.0/30"]
}
variable "r3_LB_pip_dns_lable" {
  default = "r3vpsx"
}
variable "vm1_r3_pip_dns_lable" {
  default = "vm1reg3"
}
variable "vm2_r3_pip_dns_lable" {
  default = "vm2reg3"
}

#VPN r1
variable "vnet1_vpnsubnet_addresses" {
  description = "Please enter VPN subnet address space for Region1"
  default     = ["10.1.3.0/24"]
}
variable "r1_customer_pip" {
  description = "Please enter Customer`s Region 1 IP"
  default     = ["51.148.124.115"]
}
variable "r1_customer_addresses" {
  description = "Please enter internal Customer`s network address space"
  default     = ["10.96.160.0/24"]
}

variable "r1_shared_key" {
  description = "Please enter REGION 1 IPsec shared KEY"
  default     = "1-v3ry-53cr37-1p53c-5h4r3d-k3y"
}

#VPN r2
variable "vnet2_vpnsubnet_addresses" {
  description = "Please enter VPN subnet address space for Region2"
  default     = ["10.2.3.0/24"]
}
variable "r2_customer_pip" {
  description = "Please enter Customer`s Region 2 IP"
  default     = ["51.148.124.115"]
}
variable "r2_customer_addresses" {
  description = "Please enter internal Customer`s network address space"
  default     = ["10.96.160.0/24"]
}
variable "r2_shared_key" {
  description = "Please enter REGION 2 IPsec shared KEY"
  default     = "2-v3ry-53cr37-1p53c-5h4r3d-k3y"
}

#VPN r3
variable "vnet3_vpnsubnet_addresses" {
  description = "Please enter VPN subnet address space for Region3"
  default     = ["10.3te.3.0/24"]
}
variable "r3_customer_pip" {
  description = "Please enter Customer`s Region 3 IP"
  default     = ["51.148.124.115"]
}
variable "r3_customer_addresses" {
  description = "Please enter internal Customer`s network address space"
  default     = ["10.96.160.0/24"]
}
variable "r3_shared_key" {
  description = "Please enter REGION 3 IPsec shared KEY"
  default     = "3-v3ry-53cr37-1p53c-5h4r3d-k3y"
}

#Recovery Services Vault #Recovery Services Vault #Recovery Services Vault #Recovery Services Vault #Recovery Services Vault #Recovery Services Vault #Recovery Services Vault 
variable "recovery_vault_name" {
  description = "Please enter the Recovery Serives Vault NAME"
  default     = "LRS-Test-Rec"
}
#VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM #VM 
variable "admin_username" {
  description = "The admin username of the VM that will be deployed"
  default     = "lrs-admin"
}
variable "admin_password" {
  description = "The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure"
  default     = "LRSforever-2020"
}

variable "vm1_r1_hostname" {
  description = "Hostname of the VM"
  default     = "Default1"
}
variable "vm2_r1_hostname" {
  description = "Hostname of the second VM"
  default     = "Default2"
}

variable "vm1_r2_hostname" {
  description = "Hostname of the second VM"
  default     = "Default3"
}
variable "vm2_r2_hostname" {
  description = "Hostname of the second VM"
  default     = "Default4"
}

variable "vm1_r3_hostname" {
  description = "Hostname of the second VM"
  default     = "Default5"
}
variable "vm2_r3_hostname" {
  description = "Hostname of the second VM"
  default     = "Default6"
}

#VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE #VM SIZE 
variable "vm1_r1_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_B2S"
}

variable "vm2_r1_size" {
  description = "Specifies the size of the second virtual machine."
  default     = "Standard_B2S"
}

variable "vm1_r2_size" {
  description = "Specifies the size of the second virtual machine."
  default     = "Standard_B2S"
}
variable "vm2_r2_size" {
  description = "Specifies the size of the second virtual machine."
  default     = "Standard_B2S"
}

variable "vm1_r3_size" {
  description = "Specifies the size of the second virtual machine."
  default     = "Standard_B2S"
}
variable "vm2_r3_size" {
  description = "Specifies the size of the second virtual machine."
  default     = "Standard_B2S"
}


#Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts #Storag Accounts 
variable "storage_acc_name" {
  description = "Storage Account Name -all lowercase"
  default     = "lrseomstorageaccount"
}

variable "storage_account_type" {
  description = "Defines the type of storage account to be created. Valid options are Standard_LRS, Standard_ZRS, Standard_GRS, Standard_RAGRS, Premium_LRS."
  default     = "Premium_LRS"
}

variable "boot_diagnostics_sa_type" {
  description = "(Optional) Storage account type for boot diagnostics"
  default     = "Standard_LRS"
}

variable "data_sa_type" {
  description = "Data Disk Storage Account type"
  default     = "Standard_LRS"
}



#SQL server/database #SQL server/database #SQL server/database #SQL server/database #SQL server/database #SQL server/database #SQL server/database #SQL server/database #SQL server/database 
variable "sqlserver" {
  description = "SQL Server Name"
  default     = "LRS-MFPSecure-SQL-Server"
}

variable "sqladminuser" {
  description = "SQL Admin Username"
  default     = "lrs-admin"
}

variable "sqladminpass" {
  description = "SQL Admin Password"
  default     = "LRSforever-2020"
}


#OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS #OTHERS 

variable "ssh_key" {
  description = "Path to the public key to be used for ssh access to the VM.  Only used with non-Windows vms and can be left as-is even if using Windows vms. If specifying a path to a certification on a Windows machine to provision a linux vm use the / in the path versus backslash. e.g. c:/home/id_rsa.pub"
  default     = "~/.ssh/id_rsa.pub"
}

variable "custom_data" {
  description = "The custom data to supply to the machine. This can be used as a cloud-init for Linux systems."
  default     = ""
}

variable "vnet_subnet_id" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
  default     = "default-subnet"
}

variable "public_ip_dns" {
  description = "Optional globally unique per datacenter region domain name label to apply to each public ip address. e.g. thisvar.varlocation.cloudapp.azure.com where you specify only thisvar here. This is an array of names which will pair up sequentially to the number of public ips defined in var.nb_public_ip. One name or empty string is required for every public ip. If no public ip is desired, then set this to an array with a single empty string."
  default     = [""]
}

variable "public_ip_address_allocation" {
  description = "This attribute is deprecated, and to be replaced by 'allocation_method'"
  default     = ""
}

variable "remote_port" {
  description = "Remote tcp port to be used for access to the vms created via the nsg applied to the nics."
  default     = ""
}

variable "enable_accelerated_networking" {
  type        = bool
  description = "(Optional) Enable accelerated networking on Network interface"
  default     = false
}

variable "nb_public_ip" {
  description = "Number of public IPs to assign corresponding to one IP per vm. Set to 0 to not assign any public IP addresses."
  default     = "1"
}

variable "allocation_method" {
  description = "Defines how an IP address is assigned. Options are Static or Dynamic."
  default     = ""
}

variable "vm_os_publisher" {
  description = "The name of the publisher of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "vm_os_simple" {
  description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS and SLES to get the latest image version of the specified os.  Do not provide this value if a custom value is used for vm_os_publisher, vm_os_offer, and vm_os_sku."
  default     = ""
}

variable "r1_timezone" {
  default = "Central America Standard Time"
}
variable "r2_timezone" {
  default = "Central America Standard Time"
}
variable "r3_timezone" {
  default = "Central America Standard Time"
}

variable "vm_os_id" {
  description = "The resource ID of the image that you want to deploy if you are using a custom image.Note, need to provide is_windows_image = true for windows custom images."
  default     = ""
}


variable "vm_os_offer" {
  description = "The name of the offer of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "vm_os_sku" {
  description = "The sku of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "vm_os_version" {
  description = "The version of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = "latest"
}

variable "nb_instances" {
  description = "Specify the number of vm instances"
  default     = "1"
}

variable "boot_diagnostics" {
  type        = bool
  description = "(Optional) Enable or Disable boot diagnostics"
  default     = false
}

variable "data_disk_size_gb" {
  description = "Storage data disk size size"
  default     = ""
}

variable "data_disk" {
  type        = bool
  description = "Set to true to add a datadisk."
  default     = false
}

variable "delete_os_disk_on_termination" {
  type        = bool
  description = "Delete datadisk when machine is terminated"
  default     = false
}

variable "is_windows_image" {
  description = "Boolean flag to notify when the custom image is windows based."
  default     = false
}
