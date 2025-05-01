# Ansible configuration

## Prerequisites
To run this codebase you need at least 4 machines:
- 1 x K8s Master node
- 2 x K8s Worker nodes
- 1 x Prometheus - Grafana Server

## Usage:

### 1. host_vars/
Include in the `host_vars` then IP addresses or the host names of the machines 

### 2. SSH key
Generate an SSH key and update `ansible.cfg`

### 3. Bootstrap
Run `./RUN_BOOTSTRAP` to initiate all machines

### 4. Playbook
Now you are able to run the playbook and setup machines
```bash
ansible-playbook playbook.yml
```

This will setup
- Prometheus
- Grafana
- K8s (kubeadm is used)
  - Master nodes
  - Worker nodes

### 5. Utilize K8s
Connect via ssh to master node and run using `kubectl` K8s commands.

To achieve this, make sure that you have run first:
```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

### 6. Grafana
Connect to `http://<prometheus-grafata-device>:3000` to have access to your Grafana dashboard