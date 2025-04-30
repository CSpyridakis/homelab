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
# ISO
# ===================================================

variable "download_vm_iso" {
  description = "Download ISO or use from the local storage one (default: true)"
  type        = bool
  default     = true
}

variable "iso_datastore" {
  description = "Datastore where the cloud image will be downloaded"
  type        = string
  default     = "local"
}

variable "iso_url" {
  description = "Direct URL to a Proxmox-compatible Ubuntu cloud image (e.g., qcow2) (requires download_vm_iso == true)"
  type        = string
  default     = "https://non-valid.img"
}

variable "iso_local_path" {
  description = "Local path of the ISO file (requires download_vm_iso == false)"
  type        = string
  default     = "local:iso/non-valid.img"
}

# ===================================================
# VM
# ===================================================

variable "admin_password" {
  description = "Admin password"
  type        = string
  sensitive   = true
}

variable "vm_node" {
  description = "The Proxmox node name where the VM will run"
  type        = string
  default     = "pve"
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "vm_id" {
  description = "ID of the VM"
  type        = number
}

variable "vm_user" {
  description = "Username to create in the VM"
  type        = string
  default     = "ubuntu"
}

variable "vm_give_random_pass" {
  description = "Give random password during VM initialization"
  type        = bool
  default     = true
}

variable "vm_generate_ssh_key" {
  description = "Generate a random SSH key"
  type        = bool
  default     = true
}

variable "vm_ssh_public_key" {
  description = "Public SSH key to use for connections"
  type        = string
}

variable "vm_pass" {
  description = "Password for the default user (use SSH key in production)"
  type        = string
}

variable "vm_datastore" {
  description = "Datastore to use for the main VM disk (e.g., local-lvm)"
  type        = string
  default     = "local-lvm"
}

variable "vm_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 1
}

variable "vm_memory_mb" {
  description = "Amount of RAM in MB"
  type        = number
  default     = 2048
}

variable "vm_primary_disk_size" {
  description = "Size (in GB) of the primary boot disk"
  type        = number
  default     = 16
}

variable "vm_on_boot" {
  description = "Boot vm on boot"
  type        = bool
  default     = false
}

variable "vm_static_ip" {
  description = "Set to true for static IP configuration, false for DHCP"
  type        = bool
  default     = false
}

variable "static_ip_cidr" {
  description = "Static IPv4 address with CIDR (e.g., 192.168.3.100/24)"
  type        = string
  default     = "192.168.1.100/24"
}

variable "static_ip_gateway" {
  description = "Gateway address for static IP"
  type        = string
  default     = "192.168.1.1"
}
