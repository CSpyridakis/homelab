# ===================================================
# PROXMOX
# ===================================================

variable "proxmox_endpoint" {
  description = "Proxmox API endpoint, e.g. https://192.168.1.10:8006/"
  type        = string
}

variable "proxmox_ssh_username" {
  description = "The user connected to the Proxmox instance"
  type        = string
}

variable "proxmox_ssh_key_path" {
  description = "The SSH key used to connect to the Proxmox instance"
  type        = string
}

variable "proxmox_full_token_id" {
  description = "Token ID for API access"
  type        = string
  default     = "terraform@pam!provider"
}

variable "proxmox_token" {
  description = "The token secret"
  type        = string
  sensitive   = true
}


# ===================================================
# VM
# ===================================================

variable "vm_user" {
  description = "Username to create in the VM"
  type        = string
  default     = "ubuntu"
}

variable "vm_pass" {
  description = "Password for the default user (use SSH key in production)"
  type        = string
}

variable "vm_node" {
  description = "The Proxmox node name where the VM will run"
  type        = string
  default     = "pve"
}
