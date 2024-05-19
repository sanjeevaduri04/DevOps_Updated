import os
import shutil
import time

def backup_files(source_dir, backup_dir):
    timestamp = time.strftime("%Y%m%d-%H%M%S")
    backup_path = os.path.join(backup_dir, f"backup-{timestamp}")
    shutil.copytree(source_dir, backup_path)
    print(f"Backup completed: {backup_path}")

if __name__ == "__main__":
    backup_files("/path/to/source", "/path/to/backup")


Explanation:

Purpose: Creates a backup of a specified directory with a timestamp.

Key Libraries: shutil for file operations, os for path manipulation.
    
Functionality:

Copies the contents of the source directory to a backup directory with a timestamped folder name.
Prints a message upon completion of the backup.