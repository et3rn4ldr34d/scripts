#!/bin/bash

# Infrastructure
ID=''
NAME=''
IP=''

# Colors
WHITE='\033[1;37m'
GREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 1. Zips Files | Export files to local storage
# echo -e "[${RED}o${NC}] ${GREEN}Compressing Files${NC}...";
# tar -czvf name-of-archive.tar.gz /path/to/directory-or-file
# -c: Create archive -z: Compress with gzip -v: Verbose. -f: Specifies Filename

# echo -e "[${RED}o${NC}] ${GREEN}Copying Files${NC}...";
# (Example File  /users/admin/downloads/* root@155.138.150.12:/home/)
# scp root@${IP}:/path/to/file /path/to/destination &&

# Removes files as well?

# 2. Create Snapshot | Wait for Completion before next command | Deletes Old Snapshot
# echo -e "[${RED}o${NC}] ${GREEN}Creating New Snapshot${NC}...";
# doctl compute droplet-action snapshot ${ID} --wait;

# echo -e "[${RED}o${NC}] ${GREEN}Destroying Old Snapshot${NC}: ${WHITE}${NAME}${NC}";


# 3. Destroys Droplet
echo -e "[${RED}o${NC}] ${GREEN}Destroying Droplet:${NC} ${WHITE}${NAME}${NC}";
doctl compute droplet delete ${NAME} -f; # -force
echo -e "[${GREEN}|${NC}] ${GREEN}Completed${NC}.";

# 4. Displays Current Bill
echo -e "[${RED}!${NC}] ${GREEN}Current Balance${NC}:";
doctl balance get