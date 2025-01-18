# 🏠 Homelab

---
## 🗒️ General Notes

This repository serves as the primary documentation hub for my **Homelab**.

**Homelab** is a personal project — an on-premises private infrastructure that hosts the networks and machines I use for experimenting with new technologies or providing private, self-hosted services. This approach ensures that data is stored on proprietary devices, offering a secure testbed for learning before applying similar principles in the field.

In this repository: [https://github.com/CSpyridakis/notes](https://github.com/CSpyridakis/notes), you can find general notes on various technologies. Some of these notes pertain to the creation and maintenance of this **Homelab**.

For quick access and an at-a-glance overview of the **Homelab**'s status, I use the [homepage dashboard](https://github.com/gethomepage/homepage). My configuration for this dashboard is available in the following repository: [https://github.com/CSpyridakis/homepage](https://github.com/CSpyridakis/homepage).

Regarding my Desktop Workstation, which is one of the devices in this network, I use an Ubuntu Desktop system as my daily driver. This is my main device for development. One of the most important aspects is the applications I use and their configurations. Therefore, my personal collection of dotfiles is also available here: [https://github.com/CSpyridakis/dotfiles](https://github.com/CSpyridakis/dotfiles).

---

## 🖧 Network Diagram
The core elements of my **Homelab**  are showcased in the following diagram. These elements will be described later.

![Homelab Network](./doc/Homelab.drawio.png)

---

## Router

![Mikrotik Screenshot](./doc/mikrotik.png)

## Internal network devices

### 🖥️ 1. Main Server
The role of my main server, at this point 

#### Proxmox
[Proxmox VE](https://www.proxmox.com/en/) is used as my [Τype 1](https://aws.amazon.com/compare/the-difference-between-type-1-and-type-2-hypervisors/) [Hypervisor](https://en.wikipedia.org/wiki/Hypervisor). 

![proxmox screenshot](./doc/proxmox.png)

##### 🖥️🖥️ A. Virtual Machines
Multiple VMs are created using Proxmox to run experiments that follow [IaaS]() printiples before continuing experiments in other infrastructus, either private or public. 

##### 🐳 B. Portainer
The docker-compose files that have been used for some of the services, are available here: [https://github.com/CSpyridakis/dockerfiles](https://github.com/CSpyridakis/dockerfiles).

![portainer screenshot](./doc/portainer.png)

![gninx proxy manager screenshot](./doc/nginx-proxy-manager.png)

[Duck DNS](https://www.duckdns.org/) is used to create the with the help of [Let's encrypt](https://letsencrypt.org/) for the Certificates.

##### C. Services
###### 🤖 C.1 [Ollama](https://ollama.com/)
Moreover, modelfiles are available here: [https://github.com/CSpyridakis/modelfiles](https://github.com/CSpyridakis/modelfiles).

![ollama server screenshot](./doc/ollama-server.png)

--- 

### 🖴 2. NAS 
[TrueNAS]()

![true nas screenshot](./doc/truenas.png)

#### ⚙️ Services
Among others like ([Jellyfin](), [Photoprism](), [Nextcloud](https://nextcloud.com/), etc, which are used )

##### 1. [Gitea](https://about.gitea.com/)
##### 2. [Distribution](https://distribution.github.io/distribution/)
##### 3. [Pi-hole](https://pi-hole.net/)

--- 

### 3. Intel NUC
![nuc device info](./doc/nuc.png)

### 4. Raspberry PI
![raspberry pi info](./doc/raspberry.png)

### 5. Jetson Nano
![jetson nano info](./doc/jetson-nano.png)

--- 
