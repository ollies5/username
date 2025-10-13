#!/bin/bash
# zip.sh — validate each line of a file containing ZIP codes

INPUT_FILE=${1:-zip-input}

# Check if the file exists
if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Error: file '$INPUT_FILE' not found."
  exit 1
fi

while read -r ZIP; do
  if echo "$ZIP" | grep -Eq "^[0-9]{5}$"; then
    echo "$ZIP → Valid ZIP code"
  else
    echo "$ZIP → Invalid ZIP code"
  fi
done < "$INPUT_FILE"