module "k8s_vms" {
  source  = "./modules/cloud_image_vm"

  num_of_created_vms    = 3 # 1 for Data plane and 2 as workers

  # Proxmox
  proxmox_endpoint      = var.proxmox_endpoint
  proxmox_full_token_id = var.proxmox_full_token_id
  proxmox_token         = var.proxmox_token
  proxmox_ssh_username  = var.proxmox_ssh_username
  proxmox_ssh_key_path  = var.proxmox_ssh_key_path

  # General
  vm_id                   = 400
  vm_node                 = var.vm_node
  vm_name                 = "k8s"
  vm_on_boot              = false

  # Credentials
  vm_give_random_pass     = false
  vm_user                 = var.vm_user
  vm_pass                 = var.vm_pass
  vm_generate_ssh_key     = true
  vm_ssh_public_key       = ""

  # VM hardware
  vm_cores                = 1
  vm_memory_mb            = 2048
  vm_primary_disk_size    = 16

  # ISO
  download_vm_iso = false
  iso_local_path  = "local:iso/jammy-server-cloudimg-amd64.img"
  iso_url         = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}
