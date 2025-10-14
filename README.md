# README for Username Validation Script

## Author Information
- **Name:** Oliver Shepherd
- **Course:** CPSC298
- **Assignment:** Username Validation
- **Date:** 10/13/25

## Program Description
This script validates usernames against a set of  rules to make sure they meet the requirements. It reads usernames from standard input (either from a file or interactive input) and checks each one against a regular expression pattern.

## Username Requirements
This script validates usernames according to the following rules:
- Must start with a lowercase letter
- Can only contain lowercase letters, digits, and underscores
- Must be between 3 and 12 characters in length (inclusive)

## Usage
To run the script interactively:
```bash
./username.sh
```

To test with the provided input file:
```bash
./username.sh < username-input
```

## How the Script Works
The script automatically detects whether it's running in interactive mode or file input mode by checking if standard input is a terminal using `[ -t 0 ]`. In interactive mode, it uses a `while true` loop with `read -p` to continuously prompt the user for usernames until a valid one is entered, at which point it exits with `exit 0`. In file input mode, it uses `while IFS= read -r` to process each username line by line from standard input. Before validation in file mode, the script removes any return characters to handle Windows line endings. Each username is then run through `grep`. The `grep` command checks if the username matches the pattern `^[a-z][a-z0-9_]{2,11}$`, and based on the exit status, the script displays whether the username is valid or invalid. In file mode, the loop continues until all usernames have been checked.

## Regular Expression Pattern
The validation uses the following regular expression pattern:
```
^[a-z][a-z0-9_]{2,11}$
```
This pattern makes sure that:
- The username starts with a lowercase letter `[a-z]`
- The following characters are lowercase letters, digits, or underscores `[a-z0-9_]`
- The total length is between 3 and 12 characters

## Testing Results
The script was tested using the `username-input` file containing 24 test usernames. The valid usernames the script found are:
- `jsmith`
- `jsmith_2023`
- `dev_user`
- `test123`
- `admin`
- `user`
- `john_doe`

Invalid usernames:
- `js`
- `j`
- `jsmith12345678`
- `jSmith`
- `jsmith!`
- `test-user`
- `TEST123`
- `_`
- `__test`
- `123abc`

The `username-input` file was used by providing it to the script using `./username.sh < username-input`.

## Resources
- Class materials

## License
This project is part of coursework for Chapman University and is intended for educational purposes.
