from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Hello! App is running inside Docker."
