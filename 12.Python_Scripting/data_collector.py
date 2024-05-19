import requests
from bs4 import BeautifulSoup
import csv
import time

def scrape_data(url, log_file):
    while True:
        response = requests.get(url)
        soup = BeautifulSoup(response.text, 'html.parser')
        data = soup.find(id='data_id').text
        
        with open(log_file, 'a') as file:
            writer = csv.writer(file)
            writer.writerow([time.strftime("%Y-%m-%d %H:%M:%S"), data])
        
        time.sleep(60)  # Scrape data every minute

if __name__ == "__main__":
    scrape_data("http://example.com", "data_log.csv")


Explanation:

Purpose      : Scrapes data from a webpage every minute and logs it to a CSV file.
Key Libraries: requests for HTTP requests, BeautifulSoup for parsing HTML, csv for logging data.
    
Functionality:
 - Fetches data from a specified URL.
 - Extracts the relevant data using BeautifulSoup.
 - Logs the timestamped data to a CSV file.