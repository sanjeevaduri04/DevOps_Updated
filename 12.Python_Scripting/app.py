from flask import Flask, render_template
from flask_socketio import SocketIO, emit

app = Flask(__name__)
socketio = SocketIO(app)

@app.route('/')
def index():
    return render_template('index.html')

@socketio.on('message')
def handle_message(msg):
    print(f"Received message: {msg}")
    emit('response', {'data': 'Message received!'})

if __name__ == "__main__":
    socketio.run(app, debug=True)


Explanation:

Purpose: Creates a real-time web application that uses WebSockets for bi-directional communication.
    
Key Libraries: Flask for the web framework, Flask-SocketIO for WebSocket support.
    
Functionality:
 - Serves a web page.
 - Listens for incoming WebSocket messages.
 - Sends responses back to the client.