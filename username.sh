#!/bin/bash

echo "Username Rules:"
echo "  - Must start with a lowercase letter"
echo "  - Can only contain lowercase letters, digits, and underscores"
echo "  - Must be between 3 and 12 characters long"
echo ""

if [ -t 0 ]; then
  while true; do
    read -p -r "Please enter a username: " USERNAME
    
    if echo "$USERNAME" | grep -Eq "^[a-z][a-z0-9_]{2,11}$"; then
      echo "Thank you! '$USERNAME' is a valid username."
      exit 0
    else
      echo "Invalid username. Please try again."
      echo ""
    fi
  done
else
  while IFS= read -r USERNAME; do
    USERNAME="${USERNAME%$'\r'}"
    if echo "$USERNAME" | grep -Eq "^[a-z][a-z0-9_]{2,11}$"; then
      echo "Thank you! '$USERNAME' is a valid username."
    else
      echo "Invalid username. Please try again."
    fi
    echo ""
  done
fi
