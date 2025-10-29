# Python example using logging
import logging

logging.basicConfig(filename='ddos.log', level=logging.INFO)

def log_request(ip):
    logging.info(f"Request from {ip}")
