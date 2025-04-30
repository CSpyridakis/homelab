# Proxmox Preparation

## Enable snippets in the target e.g. `local`

## Generate SSH key

```bash
ssh-keygen -t rsa -b 2048 -f ./proxmox_tf_user
ssh-add ./proxmox_tf_user
cat ./proxmox_tf_user.pub
```

Copy the output of the last command and include it in the SSH_PUBLIC_KEY

## Setup Terraform user Proxmox
```bash
# FIXME: Update these values
SSH_PUBLIC_KEY="TODO"
TF_USERNAME="terraform"

# Create role
pveum role add TFRole -privs "Datastore.Allocate Datastore.AllocateSpace Datastore.AllocateTemplate Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify SDN.Use VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt User.Modify"

# Create group
pveum groupadd terraformers --comment "Terraform automation group"

# Assign role to group
pveum aclmod / -group terraformers -role TFRole

# Create user
pveum useradd ${TF_USERNAME}@pam --comment "Terraform automation user"
pveum usermod ${TF_USERNAME}@pam -group terraformers
useradd --shell /bin/bash --home /home/${TF_USERNAME} ${TF_USERNAME} 
mkdir -p /home/${TF_USERNAME}/.ssh/
echo "${SSH_PUBLIC_KEY}" >> /home/${TF_USERNAME}/.ssh/authorized_keys
chown -R ${TF_USERNAME}:${TF_USERNAME} /home/${TF_USERNAME}/.ssh
chmod 700 /home/${TF_USERNAME}/.ssh
chmod 600 /home/${TF_USERNAME}/.ssh/authorized_keys

# Create token
pveum user token add terraform@pam provider --privsep=0
```

## Verify connection
```bash
ssh -i ./proxmox_tf_user terraform@<pve-ip-or-domain>
```


## Module Terraform.tfvars example (ONLY to test module)

```ini
# ===================================================
# PROXMOX
# ===================================================
proxmox_endpoint      = "https://192.168.1.100:8006/"
proxmox_full_token_id = "terraform@pam!provider"
proxmox_token         = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
proxmox_ssh_username  = "user"
proxmox_ssh_key_path  = "./proxmox_tf_user"

# ===================================================
# ISO
# ===================================================
download_vm_iso = false
iso_local_path  = "local:iso/jammy-server-cloudimg-amd64.img"

# ===================================================
# VM
# ===================================================
admin_password = "need-to-change-me"

# General
vm_id       = 100
vm_node     = "pve"
vm_name     = "Ubuntu-vm"
vm_on_boot  = false

# Credentials
vm_give_random_pass = false
vm_user             = "username"
vm_pass             = "password"
vm_generate_ssh_key = true

# VM hardware
vm_cores                = 1
vm_memory_mb            = 2048
vm_primary_disk_size    = 16
```

## Root terraform.tfvars example
This the only part that is required

```ini
proxmox_endpoint      = "https://192.168.1.100:8006/"
proxmox_full_token_id = "terraform@pam!provider"
proxmox_token         = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
proxmox_ssh_username  = "user"
proxmox_ssh_key_path  = "./proxmox_tf_user"

vm_user                = "user"
vm_pass                = "password"
vm_node                = "nuc-pve"
```