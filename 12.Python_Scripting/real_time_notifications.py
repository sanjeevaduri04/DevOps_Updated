import smtplib
from email.mime.text import MIMEText

def send_email(subject, body, to_email):
    from_email = "your_email@example.com"
    from_password = "your_password"

    msg = MIMEText(body)
    msg['Subject'] = subject
    msg['From'] = from_email
    msg['To'] = to_email

    server = smtplib.SMTP_SSL('smtp.example.com', 465)
    server.login(from_email, from_password)
    server.sendmail(from_email, to_email, msg.as_string())
    server.quit()

if __name__ == "__main__":
    send_email("Test Subject", "This is a test email body.", "recipient@example.com")

 Explanation:

- Purpose: Sends an email notification.
- Key Libraries: smtplib for sending emails, email.mime.text for email formatting.

Functionality:
 - Composes an email with a subject and body.
 - Sends the email to the specified recipient.