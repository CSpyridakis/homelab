#!/bin/bash

# If you need to need to reboot your LXC periodically, for different
# reasons, you can pass your VMID to this script to achieve that. 
# Add this as a cronjob, if needed, see INSTALL script
# The script will also append logs in /var/log/proxmox_cron.log

VMID=$1

# Initial log message
echo "Restart portainer attempt- [$(date)]" >> /var/log/proxmox_cron.log 2>&1

# Restart LXC
(/usr/sbin/pct stop ${VMID} && \
    /usr/sbin/pct start ${VMID} && \
    echo '-> [OK]') \
    >> /var/log/proxmox_cron.log 2>&1 