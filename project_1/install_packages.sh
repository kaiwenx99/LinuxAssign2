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
package_filepath="packages.txt" 

# Check if package file exists as a regular `file`
if [[ ! -f "$package_filepath" ]]; then
  echo "Error: Package file '$package_filepath' does not exist."
  exit 1
# Return a non-zero exit code, indicate error happened, no such package_file
fi

# Initialize an empty array to store package names
packages=()


# A while loop reads each line from "$package_filepath" and add it into packages array
while IFS= read -r line; do
# IFS(Internal Field Separator) is a built-in shell variable, a 3-char string with a space, tab, and newline
# Ref: https://www.baeldung.com/linux/ifs-shell-variable
# 'read -r' reads one line at a time from "$package_filepath"
# 'read' splits string into fields, assigning each new word to an argument
# '-r' disable backslashes to escape characters, so line reading process won't be interrupted.
# Ref: https://phoenixnap.com/kb/bash-read
  packages+=("$line")
  # Append each line (each package name) to the packages array
done < "$package_filepath"
# Pass "$package_filepath" into this while loop for iteration
# Addition: the reason for using IFS instead of for loop and cat to iterate packages.txt
# To deal with anyspecial characters or leading/trailing spaces which may caused error
# Ref: https://www.cyberciti.biz/faq/unix-linux-bash-while-read-function-define-ifs-delimiter/

# Check if packages is empty
if [[ ${#packages[@]} -eq 0 ]]; then
# If the number of elements in packages array is 0, then there is no packages in pacages.txt
# '${#packages[@]}' gets the number of elements in 'packages' array
# '-eq 0' is equal to 0
  echo "Error: No packages in '$package_filepath'."
  exit 1
# Return a non-zero exit code, indicate error happened, no packages in packages.txt
fi

# Show all available packages options to users
echo "These are the packages available for installation:"
for i in "${!packages[@]}"; do
# Display the indexes of all packages in a array
  echo "${packages[i]} (option: -${i})"
# Output example: "kakoune (option: -0)
done

echo "You can install packages by specifying options, for example, '-0 -1' to install the first two packages."

# A prompt to ask user to pass in package options for installation
read -p "Enter package options to install (e.g., '-0 -1'): " user_options
# 'read' read one line from input, and assign the input to variable "user_options".
# '-p' display a prompt
# Ref: https://ss64.com/bash/read.html

# Function to install a package
install_package() {
  local package=$1
# Assigned the first argument passed into this function to a local variable 'package'
  if pacman -S "$package" --noconfirm; then
# '-S' synchronize packages.
# '--noconfirm' skips “Are you sure?” messages when installing packages.
# Ref: https://man.archlinux.org/man/pacman.8.en
    echo "Successfully installed $package."
  else
    echo "Can not install $package."
# Output this message when installation fails.
  fi
}

# Define dynamic options for getopts
options=""
# Initializes an empty string 'option'
# Iterate over the packages array
for i in "${!packages[@]}"; do
# '${!packages[@]}' display the indexes of all packages in a array
  options+="${i}"
# Append each index from the package array to the options string
# After iteration the option will be like "01234" indicating 5 packages
done

# Parse options with 'getopts'
while getopts "$options" opt; do
# Each option in options is captured as 'opt'
# 'case' handles each possible 'opt'
  case $opt in
    # Match any number from 0 to 99
    [0-9]|[1-9][0-9])
    # This range is divided in to two ranges: [0-9] refers to 0 to 9, [1-9][0-9] refers to 10 to 99
    # Ref: https://www.regextutorial.org/regex-for-numbers-and-ranges.php
      # Convert option to an integer
      index=$(($opt)) # Assign index variable with opt value
      if [ "$index" -lt "${#packages[@]}" ]; then
            # '${#packages[@]}' calculates how many elements are there in packages array, which is the length of this array
            # '-lt' less than compares the index value and length of packages, if True, opt is within range, proceed
        # Call 'install_package' with the package at the specified index
        install_package "${packages[$index]}"

      else # When the index value is out of the range, can not install package, display error
        echo "There is no package at index $index"
      fi
      ;;
    # If option is not a number, catch all other cases using *
    *)
      echo "There is no such option: -$OPTARG"
  # '$OPTARG' is a built-in of getopts, holds the option passed in by the user
  # Ref: https://docs.oracle.com/cd/E86824_01/html/E54763/getopts-1.html
      ;;
  esac
done <<< "$user_options"
# Feed "$user_options" variable directly to while loop for processing

echo "Packages installation is completed."

