import psutil
import time
import smtplib
from email.mime.text import MIMEText

def send_alert(subject, body):
    msg = MIMEText(body)
    msg['Subject'] = subject
    msg['From'] = "your_email@example.com"
    msg['To'] = "admin@example.com"

    with smtplib.SMTP_SSL('smtp.example.com', 465) as server:
        server.login("your_email@example.com", "your_password")
        server.sendmail("your_email@example.com", "admin@example.com", msg.as_string())

def monitor_system():
    while True:
        cpu_usage = psutil.cpu_percent(interval=1)
        memory_info = psutil.virtual_memory()
        if cpu_usage > 80:
            send_alert("High CPU Usage Alert", f"CPU usage is at {cpu_usage}%")
        if memory_info.percent > 80:
            send_alert("High Memory Usage Alert", f"Memory usage is at {memory_info.percent}%")
        
        with open('/var/log/system_monitor.log', 'a') as f:
            f.write(f"Time: {time.strftime('%Y-%m-%d %H:%M:%S')}, CPU: {cpu_usage}%, Memory: {memory_info.percent}%\n")
        
        time.sleep(5)

if __name__ == "__main__":
    monitor_system()

Explanation:

Purpose: Monitors CPU and memory usage in real-time and sends an alert if usage exceeds 80%.
Key Libraries: psutil for system information, smtplib for sending emails.
    
Functionality:
 - Monitors CPU and memory usage every 5 seconds.
 - Logs the usage data to a file.
 - Sends an email alert if usage exceeds the threshold.