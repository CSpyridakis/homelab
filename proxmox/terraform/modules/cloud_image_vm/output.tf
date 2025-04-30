output "vm_password" {
  value     = random_password.vm_password.result
  sensitive = true
}

output "vm_private_key" {
  value     = tls_private_key.vm_key.private_key_pem
  sensitive = true
}

output "vm_public_key" {
  value = tls_private_key.vm_key.public_key_openssh
}

# output "vm_ipv4_address" {
#   value = proxmox_virtual_environment_vm.vm[count.index].ipv4_addresses
# }

output "admin_password" {
  value = resource.bcrypt_hash.admin.id
}