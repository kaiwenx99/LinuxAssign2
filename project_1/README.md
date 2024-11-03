# ACIT2420 Assignment 2 Project 1

## Basic Setup

Create a txt file containing a user-defined list of packages to be installed using `nvim`:

- kakoune
- tmux

> Put all packages into one file benefits future updates, by managing packages in isolated from configuration script.

The content of packages.txt:
![packges.txt](/imgs/add_packages.png)

## Call other scripts for system setup

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
