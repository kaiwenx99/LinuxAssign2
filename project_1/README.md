# ACIT2420 Assignment 2 Project 1

## Besic Setup

Make sure all scripts are executable by running:

```
chmod +x <your_script>
```

Then make a file to store packages need to be installed:
![packages](/imgs/packages.png)

## Script 1: Install Packages Logic

1. Check root priviledge

- Checks if the script being run with root privilege.
- If not, displays error message and exits with a non-zero status.

2. User guide function

- Displays syntax of how to run this script with appropriate options -i (for installing packages) and -l (for creating symbolic links).

3. Option parsing with getopts

- -i sets the variable install_packages to true.
- -l sets the variable create_links to true.
- If an unavailable option is passed, the user_guide function will be called to show the correct syntax.

4. Differnt execution based on option

- If user chooses -i, it calls the install_pacs script to install packages.
- If user chooses -l, it calls the create_symlinks script to create symbolic links.

5. No option case

- If user did not pass in any option, the user_guide function will be called to show the correct syntax.

## Script 2: Create Symbolic Links Logic

1. Check root priviledge

- Checks if the script being run with root privilege.
- If not, displays error message and exits with a non-zero status.

2. Create directory beforehand

- Creates the necessary directories using mkdir -p to ensure they exist before creating symbolic links
- -p option allows creating parent directories if needed.

3. Function for creating symbolic links:

- This function takes two arguments: the source path and the destination path.
- Checks if the source file exist using [[-e "$src_link"]].
- If the source exists, it proceed to create a symbolic link using ln -sf. Display user with result depends on succedd or failure.
- If the source file does not exist, shows error.

4. Creating symbolic links

- The script calls the create_symlink function to create symbolic links
- For example, from the bin directory in the current working directory to ~/bin.

## Script 3: Caller Script Logic

1. Check root priviledge

- Checks if the script being run with root privilege.
- If not, displays error message and exits with a non-zero status.

2. User guide

- Defines a user_guide function to show correct syntax and available options (-i and -l).
- When this function is called, indicates error happened.

3. Option parsing with getopts

- -i: Sets install_packages to true.
- -l: Sets create_links to true.
- If user passed in unavailable opttion, the user_guide function will be called to display correct syntax.

4. Executing based on user option

- If -i is passed in, calls ./install_pacs to install packages.
- If -l is passed in, calls ./create_symlinks to create symbolic links.

5. No options case

- If no option passed in, calls user_guide to show the correct syntax.
