#!/bin/bash
echo "DUMMY2A93A28E9999936C89221856EC98B8FFC" > /c/temp/secrets.txt
echo "1tUm636uS1yOEcfP5pvfqJ/ml36mF7AkyHsEU0IU" >> /c/temp/secrets.txt

DIRECTORY_TO_SEARCH="/c/source/secretleaks"
SECRETS_FILE="/c/temp/secrets.txt"
total_files=0
files_processed=0

sed_command=""
while IFS= read -r secret
do
  # Add escaping for special characters
  escaped_secret=$(printf '%s\n' "$secret" | sed -e 's:[][\/.^$*]:\\&:g')
  sed_command+="s/$escaped_secret/***REMOVED***/g;"
done < "$SECRETS_FILE"

total_files=$(find "$DIRECTORY_TO_SEARCH" -type f | wc -l)

find "$DIRECTORY_TO_SEARCH" -type f -print0 | while IFS= read -r -d '' file
do
  echo "Processing file $((++files_processed)) of $total_files: $file"
  # Use the -e option to execute the command
  sed -i -e "$sed_command" "$file"
done

rm /c/temp/secrets.txt