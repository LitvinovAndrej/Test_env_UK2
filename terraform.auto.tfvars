#Azure ID`s:
subscription_id = "36b1ebc0-7919-4627-9b00-e05c5dcd4e20"
tenant_id       = "6e57ed17-2eae-44a0-bda2-7af30ffa7490"
client_id       = "39aa9e66-f18a-4e44-884e-c6f786ef983a"
client_secret   = "v.74]1S*wW7DX_(>m6u(l,AY:69Nxu6H"

#Main ID`s
resource_group_name = "Test_env_UK"
storage_acc_name    = "lrseoms"

#VM`s ID`s
admin_username = "lrs-admin"
admin_password = "November-112020"

#TAGs for ALL and each resource
CreatedBy       = "E5655"
EnvironmentType = "Test"
ResourceOwner   = "LRS"
ManagedServices = "Yes"

#Recovery Services Vault
recovery_vault_name = "test-env-recovery"

#REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 #REGION 1 
location1                 = "centralus"
prefix1                   = "lrs"
vnet1_name                = "VNET_r1"
vnet1_address_space       = ["10.1.0.0/16"]
vnet1_subnetnet_addresses = "10.1.1.0/24"
vnet1_vpnsubnet_addresses = "10.1.3.0/24"
r1_timezone               = "GMT Standard Time"
r1_LB_pip_dns_lable       = "vpsx-r1"
r1_dns_domain_controller  = ["10.96.160.12", "10.1.2.4", "10.1.2.5"]
#r1 VPN addresses
r1_customer_pip       = "51.148.124.115"
r1_customer_addresses = ["10.96.160.0/24"]
r1_shared_key         = "1-v3ry-53cr37-1p53c-5h4r3d-k3y"

#VM1
vm1_r1_hostname      = "MSAZURE01"
vm1_r1_size          = "Standard_B2s"
vm1_r1_pip_dns_lable = "vpsx1r1"

# VM2
vm2_r1_hostname      = "MSAZURE02"
vm2_r1_size          = "Standard_B2s"
vm2_r1_pip_dns_lable = "vpsx2r1"

# SQL Server6
sqlserver    = "lrs-sql-01"
sqladminuser = "lrs-admin"
sqladminpass = "November-112020"
