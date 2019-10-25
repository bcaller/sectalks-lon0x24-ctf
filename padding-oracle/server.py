import socket
import threading
import socketserver

from os import environ

from Crypto.Cipher import DES3
from Crypto.Util.Padding import unpad


BLOCK_SIZE = 8
KEY = environ["ORACLE_KEY"].encode()
assert len(KEY) == 24
FLAG = environ["ORACLE_FLAG"].encode()
assert FLAG.startswith(b"flag{")


def decrypt(bs, iv):
    cipher = DES3.new(KEY, DES3.MODE_CBC, iv=iv)
    return unpad(cipher.decrypt(bs), BLOCK_SIZE)


class MyTCPHandler(socketserver.StreamRequestHandler):
    def handle(self):
        while True:
            self.wfile.write(b"Store a 3DES encrypted message:\nIV: ")
            try:
                iv = bytes.fromhex(self.rfile.readline().strip().decode())
                if len(iv) != 8:
                    self.wfile.write(b"\nWrong IV length\n\n\n")
                    self.rfile.readline()
                    continue
            except ValueError:
                self.wfile.write(b"\nBad IV\n\n\n")
                self.rfile.readline()
                continue
            self.wfile.write(b"MESSAGE: ")
            try:
                ciphertext = bytes.fromhex(self.rfile.readline().strip().decode())
                if len(ciphertext) % 8:
                    self.wfile.write(b"\nMessage length not multiple of block size\n\n\n")
                    self.rfile.readline()
                    continue
            except ValueError:
                self.wfile.write(b"\nBad message\n\n\n")
                self.rfile.readline()
                continue
            self.wfile.write(b"\nAttempting decryption...")
            try:
                result = decrypt(
                    ciphertext,
                    iv,
                )
                self.wfile.write(b"SUCCESS")
            except ValueError as e:
                self.wfile.write(b"ERROR\nError decrypting message\n\n\n")
            else:
                if FLAG in result:
                    self.wfile.write(b"\nMESSAGE STORED!\n\n\n")
                else:
                    self.wfile.write(b"\nMessage didn't contain flag\n\n\n")
            self.rfile.readline()


class ThreadedTCPServer(socketserver.ThreadingMixIn, socketserver.TCPServer):
    allow_reuse_address = True


def client(ip, port, message):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.connect((ip, port))
        sock.sendall(bytes(message, 'ascii'))
        response = str(sock.recv(1024), 'ascii')
        print("Received: {}".format(response))


if __name__ == "__main__":
    HOST, PORT = "", 9000

    server = ThreadedTCPServer((HOST, PORT), MyTCPHandler)
    with server:
        ip, port = server.server_address
        server.serve_forever()
