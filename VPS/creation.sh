#!/bin/bash

# Infrastructure
ID='118213687'
VMNAME='Ein'
IP='146.190.14.41'

# Colors
GREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 1. Create DO Droplet from Snapshot | Wait until created to proceed
echo -e "[${RED}o${NC}] ${GREEN}Creating Droplet: ${NC} ${WHITE}${VMNAME}${NC}...";
doctl compute droplet create ${VMNAME} --image ${ID} --size s-2vcpu-2gb --region sfo3 --wait;

#2. Find Droplet Information | Filter | Pass into Variable
echo -e "[${RED}o${NC}] ${GREEN}Finding ID${NC}...";
VMID=$(doctl compute droplet get Ein --format ID | tr -d "ID");

# 3. Assign Reserved IP to Droplet
echo -e "[${RED}o${NC}] ${GREEN}Logging in${NC}...";
doctl compute reserved-ip-action assign ${IP} ${VMID} &&
sleep 10;

# 4. Login to Droplet into SSH
ssh root@${IP}; # test
# ssh -L 59000:localhost:5901 -C -N -l root ${IP};
echo -e "[${GREEN}o${NC}] ${GREEN}Connected${NC}."