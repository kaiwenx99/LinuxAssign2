# ACIT2420 Assignment 2 Project 1

## Basic Setup

Create a txt file containing a user-defined list of packages to be installed using `nvim`:

- kakoune
- tmux

> Put all packages into one file benefits future updates, by managing packages in isolated from configuration script.

The content of packages.txt:
![packges.txt](/imgs/add_packages.png)

## Script 1: Install packages

The logic of this script can be summarized to the following steps:

1. Root Privilege Check:

- Make sure the script is executed with root privilege.
- Exit with error code if not root.

2. Package File Check:

- Define the path to packages.txt.
- Check if packages.txt exists as a regular file.
- Exit with error code if file not exist.

3. Read Packages into Array:

- Read each line from packages.txt and append it to an `packages` array.
- Make sure each line (package_name) is stored as an individual element.

4. Empty Array Check:

- Check if `packages` is empty.
- Exit with error code if no packages in packages.txt.

5. Display Packages:

- Display each package as an option with array index to let users select specific packages.

6. Prompt for Package Options:

- Prompt asks the user to enter options corresponding to package indexes for installation.

7. Define Package Installation Function:

- install_package(): For installing each specified package with pacman.

8. Parse Options with getopts:

- Initialize a string of indexes based on available packages.
- Parse user input options using getopts for each package option and install the package using the corresponding index.
- Exit with error message if user pass in an invalid index beyond `packages` range or non-index option.

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
