
#script to find a file in folder

#!/bin/bash

echo "Enter the folder path:"
read folder_path

echo "Enter the file name:"
read file_name

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
    echo "Folder '$folder_path' does not exist."
    exit 1
fi

# Search for the file within the folder
found_file=$(find "$folder_path" -type f -name "$file_name")

if [ -z "$found_file" ]; then
    echo "File '$file_name' not found in the folder '$folder_path'."
else
    echo "File '$file_name' found at path: $found_file"
fi