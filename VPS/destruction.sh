#!/bin/bash

# Infrastructure
ID='118213687'
NAME='Ein'
IP=''

# Colors
WHITE='\033[1;37m'
GREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "[${RED}-${NC}] ${GREEN}Copying Files..."${NC};

# Steps:
# 1. Export files to local

# scp username@b:/path/to/file /path/to/destination;
# Copy Files
echo -e "[${RED}-${NC}] ${GREEN}Creating Snapshot..."${NC};

# 2. Create Snapshot

# doctl compute droplet-action snapshot ${ID} --wait;
# Creates Snapshot | Waits for Completion before next command
echo -e "[${RED}-${NC}] ${GREEN}Destroying Droplet:${NC} ${WHITE}${NAME} ..."${NC};

# 3. Destroys Droplet

doctl compute droplet delete ${NAME} -fv;
# Destroys Droplet | -force -verbose
echo -e "[${GREEN}o${NC}] ${GREEN}Complete."${NC}
