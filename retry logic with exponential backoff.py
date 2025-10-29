import time
import requests

def fetch_with_retry(url, max_retries=5):
    for attempt in range(max_retries):
        try:
            response = requests.get(url, timeout=5)
            response.raise_for_status()
            return response.json()
        except requests.exceptions.RequestException:
            wait = 2 ** attempt
            print(f"Retrying in {wait}s...")
            time.sleep(wait)
    raise Exception("Max retries exceeded")
