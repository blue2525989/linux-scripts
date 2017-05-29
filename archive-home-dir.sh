#!/bin/bash

# create archive of user dir
# run $ archive-home-dir.sh <username>
# must have /archives directory in root
# to unpack tar -xvf ${USER}.tar.gz

# prints absolute path of script
echo "Executing script: $0"
# read input from terminal
read -p "Enter user name to archive: " $USER
# prints Archiving user: + the user name
echo "Archiving user: $USER"

# create archive of home directory
tar cvf /archives/${USER}.tar.gz /home/${USER}

echo "Archiving complete."

exit 0

