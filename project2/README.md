# ACIT2420 Assignment 2 Project 2

## Add New User Logic

1. Check root priviledge

- Checks if the script being run with root privilege.
- If not, displays error message and exits with a non-zero status.

2. Usage function

- Displays syntax of how to run this script with appropriate options.

3. Option parsing with getopts

- -u (for username)
- -s (for shell)
- -h (for user home dir)
- -g (optional: for adding user to new group)
- If mandatory options are not fulfilled, the usage function will be called to show the correct syntax.

4. User Existence Check

- Uses grep to check if the user already exists in /etc/passwd.
- Exits with error if the exists.

5. User Creation

- Finds the largest user ID (UID) in /etc/passwd and increments it for new user.
- Creates a new user entry in /etc/passwd with specified details.
- Exits with error if user creation fails.

6. Group Creation

- Creates a new group entry in /etc/group using the same ID as the user.
- Exits with error if group creation fails.

7. Home Directory Creation

- Creates the specified home directory.
- Copies needed default files from /etc/skel to the new user home directory.
- Changes ownership of the home directory to the new user.
- Exits with an error if any step fails.

8. Additional Group

- If additional groups are specified, it loops through each in the array user passed in.
- Checks if the group exists; creates it if not.
- Adds the user to the group using sed.
- Display error if this process fails.

## Verify running result

1. Run the script to add new user "kaiwen2":
   ![verify_pacs](/imgs/add_user.png)

2. Verify created user by running 'cat /etc/passwd/":
   ![verify_links](/imgs/verify_user.png)
