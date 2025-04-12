
import socket

HOST = '127.0.0.1'
PORT = 6432

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as socket:
    socket.bind((HOST, PORT))
    socket.listen()
    print(f"Listening on {HOST}:{PORT}...")
    connection, address = socket.accept()
    with connection:
        print(f"Connected by {address}")
        while True:
            data = connection.recv(1024)
            if not data:
                break
            print(f"[DATA RECEIVED]: {data.decode()}")
