#!/bin/bash

# Directory to store the patches
PATCH_DIR="patches"
mkdir -p "$PATCH_DIR"

# Generate the diff
DIFF_FILE="review.patch"
git diff $1 > "$DIFF_FILE"

# Variables to keep track of the current filename and hunk index
current_file=""
hunk_index=0

# Read through the diff file line by line
while IFS= read -r line; do
  # Check if the line is a diff header indicating a new file
  if [[ $line =~ ^diff\ --git\ a/([^[:space:]]+)\ b/([^[:space:]]+) ]]; then
    current_file="${BASH_REMATCH[1]}"
    hunk_index=0
  fi

  # Check if the line is the start of a new hunk
  if [[ $line =~ ^@@ ]]; then
    ((hunk_index++))
    hunk_file="$PATCH_DIR/${current_file//\//_}_hunk${hunk_index}.patch"
    echo "Creating patch file: $hunk_file"
    echo "diff --git a/$current_file b/$current_file" > "$hunk_file"
  fi

  # Append the line to the current hunk file if it's a part of a hunk
  if [[ -n $current_file && $hunk_index -gt 0 ]]; then
    echo "$line" >> "$hunk_file"
  fi
done < "$DIFF_FILE"
