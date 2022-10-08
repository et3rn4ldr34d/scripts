#!/bin/bash

# Infrastructure
ID='118213687'
NAME='Ein'
IP='146.190.14.41'

# Colors
WHITE='\033[1;37m'
GREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# echo -e "[${RED}o${NC}] ${GREEN}Copying Files..."${NC};

# Steps:
# 1. Zips Files | Export files to local storage

# tar -czvf name-of-archive.tar.gz /path/to/directory-or-file
# -c: Create an archive.
# -z: Compress the archive with gzip.
# -v: Display progress in the terminal while creating the archive, also known as “verbose” mode. The v is always optional in these commands, but it’s helpful.
# -f: Allows you to specify the filename of the archive.

# (Example File  /users/admin/downloads/* root@155.138.150.12:/home/)
# scp root@${IP}:/path/to/file /path/to/destination &&
# echo -e "[${RED}o${NC}] ${GREEN}Creating New Snapshot..."${NC};

# 2. Create Snapshot | Wait for Completion before next command | Deletes Old Snapshot

# doctl compute droplet-action snapshot ${ID} --wait;
echo -e "[${RED}o${NC}] ${GREEN}Destroying Old Snapshot:${NC} ${WHITE}${NAME}${NC}";

echo -e "[${RED}o${NC}] ${GREEN}Destroying Droplet:${NC} ${WHITE}${NAME}${NC}";

# 3. Destroys Droplet

doctl compute droplet delete ${NAME} -f; # -force
echo -e "[${GREEN}|${NC}] ${GREEN}Completed${NC}.";
echo -e "[${RED}!${NC}] ${GREEN}Current Balance${NC}:";

# 4. Displays Current Bill

doctl balance get