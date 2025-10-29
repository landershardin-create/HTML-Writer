from flask import Flask, request, jsonify
import re
import time

app = Flask(__name__)

# Simple rate limiter
user_last_request = {}

def is_rate_limited(ip, cooldown=2):
    now = time.time()
    last = user_last_request.get(ip, 0)
    if now - last < cooldown:
        return True
    user_last_request[ip] = now
    return False

# Basic input sanitizer
def sanitize_input(text):
    # Remove suspicious patterns
    patterns = [
        r"(system prompt|ignore previous instructions)",  # prompt injection
        r"(shutdown|delete|format)",                      # destructive commands
        r"(base64|eval|exec|import os)",                  # code injection
    ]
    for pattern in patterns:
        if re.search(pattern, text, re.IGNORECASE):
            return None
    return text

@app.route("/chat", methods=["POST"])
def chat():
    ip = request.remote_addr
    if is_rate_limited(ip):
        return jsonify({"error": "Rate limit exceeded"}), 429

    user_input = request.json.get("message", "")
    clean_input = sanitize_input(user_input)
    if not clean_input:
        return jsonify({"error": "Potentially malicious input detected"}), 400

    # Placeholder for actual chat logic
    response = f"Processed safely: {clean_input}"
    return jsonify({"response": response})

if __name__ == "__main__":
    app.run(debug=True)
