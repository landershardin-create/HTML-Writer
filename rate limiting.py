# Flask example using Flask-Limiter
from flask import Flask
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

app = Flask(__name__)
limiter = Limiter(get_remote_address, app=app, default_limits=["100 per minute"])

@app.route("/")
@limiter.limit("10 per second")
def index():
    return "Welcome!"
