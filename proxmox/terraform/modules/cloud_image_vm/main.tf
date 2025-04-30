# ===================================================
# Cloud-init
# ===================================================

# TODO:

resource "bcrypt_hash" "admin" {
  cleartext = var.admin_password
  cost      = 12
}

# resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
#   content_type = "snippets"
#   datastore_id = "local"
#   node_name    = var.vm_node

#   source_raw {
#     data = <<-EOF
#     #cloud-config
#     hostname: ${var.vm_name}
#     timezone: Europe/Athens
#     users:
#       - default
#       - name: admin
#         groups: sudo
#         shell: /bin/bash
#         sudo: ["ALL=(ALL) NOPASSWD:ALL"]
#         lock_passwd: false
#         passwd: ${resource.bcrypt_hash.admin.id}
#     package_update: true
#     packages:
#       - qemu-guest-agent
#       - net-tools
#       - curl
#     runcmd:
#       - systemctl enable qemu-guest-agent
#       - systemctl start qemu-guest-agent
#       - echo "done" > /tmp/cloud-config.done
#     EOF

#     file_name = "user-data-cloud-config.yaml"
#   }
# }

# ===================================================
# VM setup
# ===================================================

resource "proxmox_virtual_environment_vm" "vm" {
  count       = var.num_of_created_vms

  # -------------------------------------
  # Initial setup
  node_name   = var.vm_node
  name        = "${var.vm_name}-${count.index}"
  vm_id       = var.vm_id + count.index
  on_boot     = var.vm_on_boot
  description = "Terraform-managed VM"
  tags        = ["terraform", "cloudinit"]

  # -------------------------------------
  # Qemu agent
  agent {
    enabled = false # Enable only when qemu-guest-agent is installed
  }
  stop_on_destroy = true

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  # -------------------------------------
  # CPU
  cpu {
    cores   = var.vm_cores
    sockets = 1
    type    = "x86-64-v2-AES"
  }

  # -------------------------------------
  # Memory
  memory {
    dedicated = var.vm_memory_mb
    floating  = var.vm_memory_mb
  }

  # -------------------------------------
  # Disk
  disk {
    datastore_id = var.vm_datastore
    file_id      = var.download_vm_iso ? proxmox_virtual_environment_download_file.cloud_image[0].id : var.iso_local_path
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.vm_primary_disk_size
  }

  # -------------------------------------
  # Network device
  network_device {
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
  }

  # -------------------------------------
  # Initialization
  initialization {
    dns {
      domain  = "local"
      servers = ["1.1.1.1", "8.8.8.8"]
    }

    ip_config {
      ipv4 {
        address = var.vm_static_ip ? var.static_ip_cidr : "dhcp"
        gateway = var.vm_static_ip ? var.static_ip_gateway : null
      }
    }

    user_account {
      # do not use (user/password) in production, configure your own ssh key instead!
      keys     = var.vm_generate_ssh_key ? [trimspace(tls_private_key.vm_key.public_key_openssh)] : [var.vm_ssh_public_key]
      username = var.vm_user
      password = var.vm_give_random_pass ? random_password.vm_password.result : var.vm_pass
    }

    # user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
  }
}

# ===================================================
# VM Password
# ===================================================

resource "random_password" "vm_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

# ===================================================
# VM SSH Key
# ===================================================

resource "tls_private_key" "vm_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# ===================================================
# Download ISO image
# ===================================================

resource "proxmox_virtual_environment_download_file" "cloud_image" {
  count = var.download_vm_iso ? 1 : 0

  content_type = "iso"
  datastore_id = var.iso_datastore
  node_name    = var.vm_node
  url          = var.iso_url
}

