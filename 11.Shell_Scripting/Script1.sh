#shell script to find weather the file was created at 4:00 p.m or not

#!/bin/bash

file_path="/bin/log/file.log"

if[ -f "$file_path" ]; then

     time=$()

     date=$()

     hour=$()

  if[ "$hour" -eq  16]; then

  echo "file was created at 4 PM"

  else

  echo "file was not created at 4 PM"

  fi

else

echo "file was not exits"

fi 