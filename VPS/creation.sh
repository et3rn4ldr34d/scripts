#!/bin/bash

# Infrastructure
ID='118213687'
VMID='320000562'
VMNAME='Ein'
IP='146.190.14.41'

# Colors
GREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "[${RED}-${NC}] ${GREEN}Creating Droplet: ${NC} ${WHITE}${VMNAME}..."${NC};

# Steps:
# 1. Create DO Droplet from Snapshot

doctl compute droplet create ${VMNAME} --image ${ID} --size s-2vcpu-2gb --region sfo3 --wait;
# Creates Droplet | Waits for Creation before next command
echo -e "[${RED}-${NC}] ${GREEN}Logging in..."${NC};

# 2. Assign Reserved IP to Droplet

doctl compute reserved-ip-action assign ${IP} ${VMID};
# Assigns Static IP

# 3. Login to Droplet into SSH

# ssh -L 59000:localhost:5901 -C -N -l root ${IP};
ssh root@${IP};

# Creates SSH connection
echo -e "[${GREEN}o${NC}] ${GREEN}Connected."${NC}