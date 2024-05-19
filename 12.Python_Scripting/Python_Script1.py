#pyton script to find weather httpd service is running or not

#To determine if the httpd (Apache HTTP Server) service is running on a system using a Python script, 
#you can use the subprocess module to execute shell commands. This approach works on Unix-like systems 
#where you can check the status of services using commands like systemctl or service.

#Here's a Python script that uses subprocess to check if the httpd service is running:

import subprocess

def is_service_running(service_name):
    try:
        # Execute the systemctl command to check the service status
        result = subprocess.run(['systemctl', 'is-active', service_name], capture_output=True, text=True)
        # Check the output of the command
        if result.returncode == 0:
            return True
        else:
            return False
    except Exception as e:
        print(f"An error occurred: {e}")
        return False

def main():
    service_name = 'httpd'
    if is_service_running(service_name):
        print(f"The {service_name} service is running.")
    else:
        print(f"The {service_name} service is not running.")

if __name__ == "__main__":
    main()


#Explanation:

#Import subprocess: The subprocess module allows you to spawn new processes, connect to their 
  input/output/error pipes, and obtain their return codes.

#Define is_service_running Function:

- This function takes the name of the service as an argument.
- It runs the systemctl is-active <service_name> command to check the status of the service.
- capture_output=True captures the command output, and text=True ensures the output is returned as a 
  string.
- If the return code of the command is 0, it means the service is active. Otherwise, the service is not
  running.


- Main Function:

 - Specifies the httpd service.
 - Calls is_service_running and prints whether the service is running"
