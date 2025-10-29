import time
import socket

def ping(host):
    start = time.time()
    try:
        socket.create_connection((host, 80), timeout=2)
        latency = time.time() - start
        return latency
    except Exception:
        return None

latency = ping("example.com")
if latency and latency > 0.5:
    print("High latency detected — throttling updates.")
