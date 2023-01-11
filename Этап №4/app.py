from dotenv import dotenv_values
from flask import Flask, make_response, redirect, request, session, url_for, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
from flask_sqlalchemy import SQLAlchemy
import psycopg2
import os
from decouple import config
from sshtunnel import SSHTunnelForwarder

app = Flask(__name__)
app.config['SECRET_KEY'] = config('SECRET_KEY')
app.config['SQLALCHEMY_DATABASE_URI'] = config('SQLALCHEMY_DATABASE_URI')
cursor = None

@app.route('/')
def index():
    return 'Easy ER-model!!!'

@app.route('/get', methods=['GET'])
def get():
    # cursor.execute('SELECT * from coach;')
    # coaches = cursor.fetchall()
    # cursor.close()
    # print(coaches)
    test_data = {'1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6}
    return jsonify(test_data)

@app.route('/exchange', methods=['POST'])
def exchange():
    test_data = request.get_json()
    print(test_data)
    my_data = {'1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6}
    return jsonify(my_data)

@app.route('/profile/<username>', methods=['GET'])
def profile(username):
    return f'Профиль пользователя: {username}'


@app.route('/login', methods=['POST'])
def login():
    content = request.json
    username = content.get('username')
    password = content.get('password')
    # TODO get username_db and hash_password from DB
    # if username == username_db and check_password_hash(hash_password, password): # registered
    if username and username == 'me' and password == '12':
        return make_response(jsonify(status_code='ok'), 200, {'Content-Type': 'application/json'})
    else:
        return make_response(jsonify(status_code='error'), 401, {'Content-Type': 'application/json'})
       
@app.route('/register', methods=['POST'])
def register():
    content = request.json
    username = content.get('username')
    password = content.get('password')
    if username and password:
        hash_password = generate_password_hash(password)
        # TODO send username and hash_password to DB
        return make_response(jsonify(status_code='ok'), 200, {'Content-Type': 'application/json'})
    else:
        return make_response(jsonify(status_code='error'), 404, {'Content-Type': 'application/json'})       
 
@app.route('/transfer')
def transfer():
    return redirect(url_for('index'), 301)

# один раз до первого запроса
@app.before_first_request
@app.before_request
def before_request():
    # connect to db
    try:
        SERVER_URL='se.ifmo.ru'
        SSH_PRIVATE_KEY_PATH=config('SSH_PRIVATE_KEY_PATH')
        REMOTE_USERNAME=config('REMOTE_USERNAME')
        REMOTE_PASSWORD=config('REMOTE_PASSWORD')
        with SSHTunnelForwarder(
            (SERVER_URL, 2222),
            ssh_private_key=SSH_PRIVATE_KEY_PATH,
            ssh_username=REMOTE_USERNAME,
            ssh_password=REMOTE_PASSWORD, 
            remote_bind_address=('localhost', 5432)
        ) as server:
            
            server.start()
            print("server connected")

            DB_NAME=config('DB_NAME')
            DB_USERNAME=config('DB_USERNAME')
            DB_PASSWORD=config('DB_PASSWORD')
            DB_HOST=config('DB_HOST')
            DB_PORT=config('DB_PORT')
            # db = SQLAlchemy(app)
            params = {
                'dbname': DB_NAME,
                'user': DB_USERNAME,
                'password': DB_PASSWORD,
                'host': DB_HOST,
                'port': DB_PORT
            }
            conn = psycopg2.connect(**params)
            print("database connected")
            # Open a cursor to perform database operations
            global cursor
            cursor = conn.cursor()
    except Exception as e:
        print("Connection Failed")
        print(e)

# # до текущего запроса
# @app.before_request

# # после текущего запроса
# @app.after_request

# # всегда вне зависимости от того, возвращает ли обработчик исключение или нет
# @app.teardown_request
# def teardown_request(response):
#     # TODO disconnect from db
#     print('teardown_request')
#     ...
#     return response

if(__name__ == '__main__'):
   app.run(debug=True, port=32456)
   