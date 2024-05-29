shell script to find a word in file

#!/bin/bash

echo "Enter the file path:"
read file_path

echo "Enter the word to search:"
read search_word

# Check if the file exists
if [ ! -f "$file_path" ]; then
    echo "File '$file_path' does not exist."
    exit 1
fi

# Search for the word in the file
if grep -q "$search_word" "$file_path"; then
    echo "Word '$search_word' found in the file."
else
    echo "Word '$search_word' not found in the file."
fi