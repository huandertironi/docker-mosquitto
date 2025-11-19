from http.server import BaseHTTPRequestHandler, HTTPServer

PORT = 8080  # FIXED PORT not used by Mosquitto or Render internals

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"OK")

HTTPServer(("", PORT), Handler).serve_forever()
