
import socket

HOST = '127.0.0.1'
PORT = 6432

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
    sock.bind((HOST, PORT))
    sock.listen()
    print(f"\nListening on [{HOST}:{PORT}]...")

    while True:
        connection, address = sock.accept()
        print(f"\nConnected with [{address}]")
        try:
            while True:
                data = connection.recv(1024)
                if not data: break
                print(f"{data.decode()}", end="")
        finally:
            print(f"\nClosing connection with [{address}]")
            connection.close()
