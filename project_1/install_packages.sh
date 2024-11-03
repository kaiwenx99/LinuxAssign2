#!/bin/bash
# Specify the interpreting shell for this script

# Check if the script is run as root by comparing root user ID 0 with envionment user ID
# Ref: man bash, /EUID section
if [[ $EUID -ne 0 ]]; then
  echo "Error: Please run this script with root privilege."
  exit 1
# Return a non-zero exit code, indicate error happened, user don't have priviledge to run it
fi


# Define the path variable pointing to the package file
package_file="packages.txt" 

# Check if package file exists as a regular `file`
if [[ ! -f "$package_file" ]]; then
  echo "Error: Package file '$package_file' does not exist."
  exit 1
# Return a non-zero exit code, indicate error happened, no such package_file
fi

# FOLLOWING: DISPLAY USER WITH SYNTAX GUIDE
