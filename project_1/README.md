# ACIT2420 Assignment 2 Project 1

## Script 1: Install packages

1. Check root priviledge

- Check if the script being run with root privilege.
- If not, display error message and exits with a non-zero status.

2. Handle installation failure

- Initiate fack_packages array to store names of packages failed to install

3. Define install_package function

- To install a package
- Steps: if a package is installed or not, installs it if not, record installation failures, display info to user

4. Process user specified options

- Loops through each package passed in as an argument to the script by user
- Calls install_package for each specified package to install

5. Handle installation failure complete

- After all installations, check if failed_packages is empty
- If there are failures: List failed packages, print an error message, and exit with an error code
- If all packages installed successfully: Print a success message

## Script 2: Create symbolic links

## Script 3: Call other scripts for system setup

To make sure the script is executable, run the following command first:

```
chmod +x ./call_scripts.sh
```

> Add execution permission to this script file

Then run this script with root privilege with `sudo`:

```
sudo ./call_scripts.sh
```

> Execute call_scripts.sh to call the install_packges script and symbolic_links script

## ADD OUTPUT HERE (DEBUG)
