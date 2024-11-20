# from flask import Flask
import get_data as db
# app = Flask(__name__)

# @app.route("/")
# def hello_world():
#     return "<p>Hello, World!</p>"

# @app.route("/login")
# def login():
#     return "<p>Hello, World!</p>"

# @app.route("/loginFail")
# def failed_login():
#     return "<p>Hello, World!</p>"

# @app.route("/loginFail")
# def failed_login():
#     return "<p>Hello, World!</p>"

x = db.Database()
print(x.get_users())

