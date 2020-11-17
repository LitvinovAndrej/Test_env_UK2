#Show the local admin and pass
output "Local-Admin-USERNAME-For-ALL-VMs" {
  value = var.admin_username
}
output "Local-Admin-PASSWORD-For-ALL-VMs" {
  value = var.admin_password
}

#VMs Info
output "Region1_VM1_hostname" {
  value = azurerm_virtual_machine.name1.name
}
output "Region1_VM2_hostname" {
  value = azurerm_virtual_machine.name2.name
}


# VM Public IPs
output "Region1_VM1_Public_IP" {
  value = azurerm_public_ip.name1.ip_address
}
output "Region1_VM2_Public_IP" {
  value = azurerm_public_ip.name2.ip_address
}

# Load Balancers Public IPs
output "Region1_Load_Balancer_Public_IP" {
  value = azurerm_public_ip.name7.ip_address
}


# VPN INFO
output "Region1_VPN_Public_IP" {
  value = azurerm_public_ip.example1.ip_address
}
output "Region1_VPN_Shared_KEY" {
  value = var.r1_shared_key
}
