import socket

HOST = '192.168.1.53' 
PORT = 4196

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    conn, addr = s.accept()
    with conn:
        while True:
            data = conn.recv(1024)
            print(data)
            if not data:
                break
            conn.sendall(data)
