#!/bin/bash

# Check if the script is run as root by comparing root user ID 0 with envionment user ID
# Ref: man bash, /EUID section
if [[ $EUID -ne 0 ]]; then
  echo "Error: Please run this script with root privilege."
  exit 1
# Return a non-zero exit code, indicate error happened, user don't have priviledge to run it
fi

# Call the package installation script
./install_packages.sh

# Call the symbolic link setup script
./symbolic_links.sh

echo "Your system is setup successfully"
