import sqlite3
import time

def get_real_time_value():
    # Placeholder for getting the real-time value
    return 42.0

def insert_data():
    conn = sqlite3.connect('example.db')
    cursor = conn.cursor()
    
    cursor.execute('''CREATE TABLE IF NOT EXISTS data
                      (timestamp TEXT, value REAL)''')
    
    while True:
        timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
        value = get_real_time_value()
        cursor.execute("INSERT INTO data (timestamp, value) VALUES (?, ?)", (timestamp, value))
        conn.commit()
        time.sleep(60)

if __name__ == "__main__":
    insert_data()


 Explanation:

 Purpose: Inserts real-time data into an SQLite database every minute.
 Key Libraries: sqlite3 for database operations.
   
 Functionality:
  - Creates a database table if it doesn't exist.
  - Inserts timestamped data into the table every minute.
  - Commits the transaction after each insert.