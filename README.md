# 🏠 Homelab

Technologies used:
<!-- Proxmox -->
<a href="https://www.proxmox.com/en/">
    <img style="height: 25px" src="https://www.proxmox.com/images/proxmox/Proxmox_logo_standard_hex_400px.png#joomlaImage://local-images/proxmox/Proxmox_logo_standard_hex_400px.png?width=400&height=60" alt="Proxmox logo">
</a>

<!-- TrueNAS -->
<a href="">
    <img style="height: 25px" src="https://www.truenas.com/wp-content/uploads/2024/05/TrueNAS-Scale-Logo-small.png" alt="TrueNAS logo">
</a>

<!-- Portainer -->
<a href="https://www.portainer.io/">
    <img style="height: 30px" src="https://www.portainer.io/hubfs/portainer-logo-black.svg" alt="Portainer logo">
</a>

<!-- Homepage -->
<a href="https://gethomepage.dev/">
    <img style="height: 25px; background-color:rgb(43, 110, 245)" src="https://gethomepage.dev/assets/banner_light@2x.webp" alt="Homepage logo">
</a>

<!-- Raspberry Pi -->
<a href="https://www.raspberrypi.com/">
    <img style="height: 28px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOZVY135z1l30pDAIknyG3FiOhAUnN-NeKiQ&s" alt="Raspberry Pi logo">
</a>


<!-- Mikrotik -->
<a href="https://mikrotik.com/">
    <img style="height: 25px" src="https://mikrotik.com/img/mtv2/newlogo.svg" alt="Mikrotik logo">
</a>

<!-- Ollama -->
<a href="https://ollama.com/">
    <img style="height: 28px; padding-left:5px" src="https://ollama.com/public/ollama.png" alt="Ollama logo">
</a>

<!-- Gitea -->
<a href="https://about.gitea.com/">
    <img style="height: 25px" src="https://about.gitea.com/gitea-text.svg" alt="Gitea logo">
</a>

<!-- Nginx Proxy manager-->
<a href="https://nginxproxymanager.com/">
    <img style="height: 30px" src="https://nginxproxymanager.com/logo.svg" alt="Nginx Proxy Manager logo">
</a>

<!-- Pi-hole -->
<a href="https://pi-hole.net/">
    <img style="height: 25px; background-color:rgb(162, 59, 59); padding-left:4px" src="https://pi-hole.net/wp-content/uploads/2023/05/pihole-logo-horizontal-white-e1683321640117.png" alt="Pi-hole logo">
</a>

<!-- Distribution -->
<a href="https://distribution.github.io/distribution/">
    <img style="height: 40px" src="https://distribution.github.io/distribution/brand.svg" alt="Distribution logo">
</a>

<!-- Next Cloud -->
<a href="https://nextcloud.com/">
    <img style="height: 35px; background-color:rgb(39, 205, 255)" src="https://nextcloud.com/c/uploads/2023/02/logo_nextcloud_white.svg" alt="Next Cloud  logo">
</a>

<!-- NVIDIA Jetson -->
<a href="https://www.nvidia.com/en-eu/autonomous-machines/embedded-systems/">
    <img style="height: 28px" src="https://upload.wikimedia.org/wikipedia/sco/2/21/Nvidia_logo.svg" alt=" logo">
</a>

## General Notes
This repository serves as the primary documentation point for my **Homelab**.

The **Homelab** is a personal project, more specifically is an on-premises private infrastructure that accommodates the networks and devices I use for experimenting with new technologies or providing private area self-hosted services. This approach ensures that the data created is stored on proprietary devices, providing a safe testbed for learning, before applying similar principles in the field. 

In this repository: [https://github.com/CSpyridakis/notes](https://github.com/CSpyridakis/notes), you can find general notes on various technologies. Some of these notes are relevant to the creation and maintenance of this **Homelab**.

For quick access and an at-a-glance overview of the **Homelab**'s status, I use the [homepage dashboard](https://github.com/gethomepage/homepage). You can find my configuration for this dashboard in the following repository: https://github.com/CSpyridakis/homepage.

Regarding my Desktop Workstation, which is one of the devices in this network, I use an Ubuntu Desktop system as my daily driver. My personal collection of dotfiles is also available here: [https://github.com/CSpyridakis/dotfiles](https://github.com/CSpyridakis/dotfiles).

---

## Network Diagram
![Homelab Network](./doc/Homelab.drawio.png)
---

## Router

![]()

## Internal network devices

### 1. Main Server
The role of my main server, at this point 

#### Proxmox
[Proxmox VE](https://www.proxmox.com/en/) is used as my [Τype 1](https://aws.amazon.com/compare/the-difference-between-type-1-and-type-2-hypervisors/) [Hypervisor](https://en.wikipedia.org/wiki/Hypervisor). 

![proxmox screenshot](./doc/proxmox.png)

##### A. Virtual Machines
Multiple VMs are created using Proxmox to run experiments that follow [IaaS]() printiples before continuing experiments in other infrastructus, either private or public. 

##### B. Portainer
The docker-compose files that have been used for some of the services, are available here: [https://github.com/CSpyridakis/dockerfiles](https://github.com/CSpyridakis/dockerfiles).

![portainer screenshot](./doc/portainer.png)

![gninx proxy manager screenshot](./doc/nginx-proxy-manager.png)

[Duck DNS](https://www.duckdns.org/) is used to create the with the help of [Let's encrypt](https://letsencrypt.org/) for the Certificates.

##### C. Services
###### C.1 [Ollama](https://ollama.com/)
Moreover, modelfiles are available here: [https://github.com/CSpyridakis/modelfiles](https://github.com/CSpyridakis/modelfiles).

![ollama server screenshot](./doc/ollama-server.png)

--- 

### 2. NAS 
[TrueNAS]()

![true nas screenshot](./doc/truenas.png)

#### Services
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
