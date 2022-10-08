#!/bin/bash

# Infrastructure
VMNAME='Ein'
ID='118213687'
IP='146.190.14.41'

# Colors
WHITE='\033[1;37m'
GREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 1. Create DO Droplet from Snapshot | Wait until created to proceed
echo -e "[${RED}o${NC}] ${GREEN}Creating Droplet: ${WHITE}${VMNAME}${NC}";
doctl compute droplet create ${VMNAME} --image ${ID} --size s-2vcpu-2gb --region sfo3 --wait;

# 2. Find Droplet Information | Filter | Pass into Variable
echo -e "[${RED}o${NC}] ${GREEN}Finding ID${NC}...";
VMID=$(doctl compute droplet get ${VMNAME} --format ID | tr -d "ID");

# 3. Assign Reserved IP to Droplet
doctl compute reserved-ip-action assign ${IP} ${VMID} &&
echo -e "[${RED}o${NC}] ${GREEN}IP Assigned${NC}...";

# 4. Login to Droplet into SSH

# Pings IP | If available, connect, if not, wait
sleep 30;
ping -c 1 ${IP};
if echo $?=0
then
    echo -e "[${RED}o${NC}] ${GREEN}Logging in${NC}...";
    ssh root@${IP}; # test
else
    echo -e "[${RED}o${NC}] ${RED}Unavailable${NC}.";
fi
# ssh -L 59000:localhost:5901 -C -N -l root ${IP};
# echo -e "[${GREEN}o${NC}] ${GREEN}Connected${NC}."