terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.76.1"
      # configuration_aliases = [ proxmox.alternate ]
    }

    bcrypt = {
      source = "viktorradnai/bcrypt"
      version = "0.1.2"
      # configuration_aliases = [ bcrypt.alternate ]
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = "${var.proxmox_full_token_id}=${var.proxmox_token}"

  insecure = true

  ssh {
    agent       = true
    username    = var.proxmox_ssh_username
    private_key = file(var.proxmox_ssh_key_path)
  }
}