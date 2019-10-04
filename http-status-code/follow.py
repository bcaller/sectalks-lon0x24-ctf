from os import environ
from random import choice
from string import hexdigits
from http.server import BaseHTTPRequestHandler, HTTPServer


paths = [
    f"/{i+1}-{''.join(choice(hexdigits[:16]) for _ in range(i + 4))}"
    for i in range(8)
]
FLAG = environ["STATUS_CODE_FLAG"]


def link(path):
    return f"<html><body><a href=\"{path}\">Go here</a></body></html>".encode()


class Handler(BaseHTTPRequestHandler):
    def version_string(self):
        return "\xf0\x9f\x8d\x86"

    def do_GET(self):
        p = iter(paths)
        if self.request_version not in ("HTTP/1.0", "HTTP/1.1"):
            self.send_error(400, "Bad HTTP request version")
        elif self.path == '/':
            self.send_response(401)
            self.send_header('WWW-Authenticate', 'Basic realm="Humans can ignore this", charset="UTF-8"')
            self.end_headers()
            self.wfile.write(link(next(p)))
        elif self.path == next(p):
            self.send_response(302)
            redirect = next(p)
            self.send_header('Location', redirect)
            self.end_headers()
            self.wfile.write(link(redirect))
        elif self.path == next(p):
            self.send_response(301)
            count = 0
            key = "count-to-ninety"
            for part in self.headers.get("Cookie", "a=b").split(";"):
                k, v = part.strip().split("=")
                if k == key:
                    count = int(v)
            if count != 90:
                self.send_header('Set-Cookie', f"{key}={count+1}; HttpOnly; Max-Age=20;")
                self.send_header('Location', self.path)
                self.end_headers()
                self.wfile.write(link(self.path))
            else:
                redirect = next(p)
                self.send_header('Location', redirect)
                self.end_headers()
                self.wfile.write(link(redirect))
        elif self.path == next(p):
            self.send_response(200)
            self.send_header('Content-type','text/html')
            content = link(next(p))
            self.send_header('Content-length', len(content))
            self.end_headers()
            self.wfile.write(content)
        elif self.path == next(p):
            self.send_response(304)
            self.end_headers()
            self.wfile.write(link(next(p)))
        elif self.path == next(p):
            self.send_response(200)
            self.send_header('Content-type','text/html')
            content = b"<html><body>Nothing to see here<br/>"
            self.send_header('Content-length', len(content))
            self.end_headers()
            self.wfile.write(content)
            self.wfile.write(f"<a href=\"{next(p)}\">Go here</a></body></html>".encode())
        elif self.path == next(p):
            self.send_response_only(101)
            self.end_headers()
            self.wfile.write(link(next(p)))
        elif self.path == next(p):
            self.send_response(204)
            self.end_headers()
            self.wfile.write(link(next(p)))
        elif self.path == next(p):
            self.send_response(-1, "**Why not try method fL4G**")
            self.send_header('Content-type','text/html')
            self.end_headers()
            self.wfile.write(b"Is this OK?")
        else:
            self.send_error(404)

    def do_fL4G(self):
        if self.path == paths[-1]:
            self.send_response(200, "OK")
            self.end_headers()
            hidden = b"\x1b[8m "
            self.wfile.write(hidden)
            self.wfile.write(FLAG.encode())
            self.wfile.write(b"\n")
        else:
            self.send_error(404)


def run(server_class=HTTPServer, handler_class=Handler):
    server_address = ('', 8000)
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()


run()
