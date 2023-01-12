from dotenv import dotenv_values
from flask import Flask, abort, make_response, redirect, request, session, url_for, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
from flask_sqlalchemy import SQLAlchemy
import psycopg2
from decouple import config
from flask_cors import CORS
from collections import OrderedDict

app = Flask(__name__)
cors = CORS(app, resource={
    r"/*":{
        "origins":"*"
    }
})
app.config['JSON_AS_ASCII'] = False
app.config['JSON_SORT_KEYS'] = False
connection = None
cursor = None

@app.route('/')
def index():
    return 'Easy ER-model!!!'

@app.route('/get/sportsmen', methods=['GET'])
def get_sportsmen():
    try:
        cursor.execute('SELECT * from sportsman;')
        athletes = cursor.fetchall()
        
        response_data = dict()
        for id, full_name, sex, date_of_birth, fk_sport_team_id in athletes:
            response_data[id] = {
                'full_name': full_name,
                'sex': sex,
                'date_of_birth': date_of_birth,
                'fk_sport_team_id': fk_sport_team_id
            }

        if(response_data):
            return make_response(jsonify(response_data), 200, {'Content-Type': 'application/json'})
        else:
            return abort(500, 'Record not found') 
    except Exception as e:
        return abort(500, e)
            
@app.route('/get/baa', methods=['GET', 'POST'])
def get_baa():
    try:
        if(request.method == 'GET'):
            request_data = request.args
        elif(request.method == 'POST'):
            print("adsa")
            request_data = request.get_json()
            print(request_data)
        else:
            request_data = dict()
            
        if(request_data.get('count')):
            count = request_data.get('count')
        else:
            count = 0
            
        if(request_data.get('order_type')):
            order_type = request_data.get('order_type')
        else:
            order_type = 'rate'
            
        if(order_type == 'rate'):
            cursor.execute("SELECT * FROM GetTopBAAsByRating({count}); ".format(count=count))    
        elif(order_type == 'uses'):
            cursor.execute("SELECT * FROM GetTopBAAsByUses({count}); ".format(count=count))    
        else:
            return abort(500, 'Request not found') 
        
        baas = cursor.fetchall()

        response_data = list()
        if(order_type == 'rate'):
            for id, name, manufacturer, description, uses, all_time_rate_difference in baas:
                response_data.append({
                    'id': id,
                    'name': name,
                    'manufacturer': manufacturer,
                    'description': description,
                    'uses': uses,
                    'all_time_rate_difference': all_time_rate_difference
                })
        elif(order_type == 'uses'):
            for id, name, manufacturer, description, uses, all_time_rate_difference in baas:
                response_data.append({
                    'id': id,
                    'name': name,
                    'manufacturer': manufacturer,
                    'description': description,
                    'uses': uses,
                    'all_time_rate_difference': all_time_rate_difference
                })
        else:
            return abort(500, 'Request not found') 
        response = dict()
        response['body'] = response_data
        if(response):
            return make_response(jsonify(response), 200, {'Content-Type': 'application/json'})
        else:
            return abort(500, 'Request not found') 
    except Exception as e:
        return abort(500, e)

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

# # один раз до первого запроса
# @app.before_first_request
# def before_first_request():
#     # connect to db
#     try:
#             DB_NAME=config('DB_NAME')
#             DB_USERNAME=config('DB_USERNAME')
#             DB_HOST=config('DB_HOST')
#             DB_PORT=config('DB_PORT')
#             connection = psycopg2.connect(
#                 database=DB_NAME,
#                 user=DB_USERNAME,
#                 host=DB_HOST,
#                 port=DB_PORT,
#             )
#             print('The database is connected successfully')
#             cursor = connection.cursor()
#             cursor.execute('SELECT * from coach;')
#             coaches = cursor.fetchall()
#             cursor.close()
#             print(coaches)
#             connection.close()
#     except Exception as e:
#         print("Database connection failure:")
#         print(e)
            
# до текущего запроса
@app.before_request
def before_request():
    try:
        global cursor
        cursor = connect_to_db(
                    config('DB_LOCAL_NAME'),
                    config('DB_LOCAL_USERNAME'),
                    config('DB_LOCAL_PASSWORD'),
                    config('DB_LOCAL_HOST'),
                    config('DB_LOCAL_PORT')
                )
        prepare_functions()
    except Exception as e:
        print("Database connection failure:")
        print(e)
        
# после текущего запроса всегда вне зависимости от того, возвращает ли обработчик исключение или нет
@app.teardown_request
def teardown_request(response):
    drop_functions()
    if connection:
        connection.close()
        if(cursor):
            cursor.close()
        print("Соединение с PostgreSQL после запроса закрыто")
    return response

def connect_to_db(database, user, password, host, port):
    try:
        global connection
        connection = psycopg2.connect(
            database=database,
            user=user,
            password=password,
            host=host,
            port=port,
        )
        print('The database is connected successfully')
        cursor = connection.cursor()
        return cursor
    except Exception as e:
        print("Database connection failure:")
        print(e)

def create_func(query):
    try:
        global cursor
        cursor.execute(query)
        connection.commit()
    except (Exception, psycopg2.Error) as error:
        print("Ошибка при работе с PostgreSQL", error)

def drop_functions():
    postgresql_funcs = [
        """DROP FUNCTION IF EXISTS GetTopBAAsByRating;""",
        "DROP FUNCTION IF EXISTS GetTopBAAsByUses;",
        "DROP FUNCTION IF EXISTS GetTopTrainingsByRating;",
        "DROP FUNCTION IF EXISTS GetTopTrainingsByUses;",
        "DROP FUNCTION IF EXISTS GetExercisesForTraining;",
        "DROP FUNCTION IF EXISTS GetTopPreparations;",
        "DROP FUNCTION IF EXISTS GetInfoAboutPreparation;",
        "DROP FUNCTION IF EXISTS GetCompetitionsForSportsman;",
        "DROP FUNCTION IF EXISTS GetTopSportsmenFromSportTeam;",
        "DROP FUNCTION IF EXISTS GetTopSportTeams;",
        'DROP FUNCTION IF EXISTS GetCurrentPreparationsForSportsman;'
    ]
    for postgresql_func in postgresql_funcs:
        create_func(postgresql_func)

def prepare_functions():
    postgresql_funcs = [
        """
            CREATE OR REPLACE FUNCTION GetTopBAAsByRating(number integer)
            RETURNS TABLE(baa_id integer, baa_name varchar(100), baa_manufacturer varchar(50), baa_description text, baa_uses int, baa_rate int)
            AS $$
            BEGIN
                IF number = 0 then
                return query (select baa.baa_id, name, manufacturer, description, baa_rate.number_uses, baa_rate.all_time_rate_difference from baa
                    join baa_rate on baa.baa_id = baa_rate.fk_baa_id order by baa_rate.all_time_rate_difference desc);
                ELSE
                return query (select baa.baa_id, name, manufacturer, description, baa_rate.number_uses, baa_rate.all_time_rate_difference from baa
                    join baa_rate on baa.baa_id = baa_rate.fk_baa_id order by baa_rate.all_time_rate_difference desc limit number);
                END IF;
            END;
            $$ LANGUAGE plpgsql;
        """,
        """
            CREATE OR REPLACE FUNCTION GetTopBAAsByUses(number integer)
            RETURNS TABLE(baa_id integer, baa_name varchar(100), baa_manufacturer varchar(50), baa_description text, baa_uses int, baa_rate int)
            AS $$
            BEGIN
                IF number = 0 then
                return query (select baa.baa_id, name, manufacturer, description, baa_rate.number_uses, baa_rate.all_time_rate_difference from baa
                    join baa_rate on baa.baa_id = baa_rate.fk_baa_id order by baa_rate.number_uses desc);
                ELSE
                return query (select baa.baa_id, name, manufacturer, description, baa_rate.number_uses, baa_rate.all_time_rate_difference from baa
                    join baa_rate on baa.baa_id = baa_rate.fk_baa_id order by baa_rate.number_uses desc limit number);
                END IF;
            END;
            $$ LANGUAGE plpgsql;
        """,
        """
            CREATE OR REPLACE FUNCTION GetTopTrainingsByRating(number integer)
            RETURNS TABLE(training_id integer, training_name varchar(100), training_description text, training_rate int)
            AS $$
            BEGIN
                IF number = 0 then
                return query (select training.training_id, training.name, training.description, training_rate.all_time_rate_difference from training
                    join training_rate on training.training_id = training_rate.fk_training_id order by training_rate.all_time_rate_difference desc);
                ELSE
                return query (select training.training_id, training.name, training.description, training_rate.all_time_rate_difference from training
                    join training_rate on training.training_id = training_rate.fk_training_id order by training_rate.all_time_rate_difference desc limit number);
                END IF;
            END;
            $$ LANGUAGE plpgsql;
        """,
        """
            CREATE OR REPLACE FUNCTION GetTopTrainingsByUses(number integer)
            RETURNS TABLE(training_id integer, training_name varchar(100), training_description text, training_rate int)
            AS $$
            BEGIN
                IF number = 0 then
                return query (select training.training_id, training.name, training.description, training_rate.number_uses from training
                    join training_rate on training.training_id = training_rate.fk_training_id order by training_rate.number_uses desc);
                ELSE
                return query (select training.training_id, training.name, training.description, training_rate.number_uses from training
                    join training_rate on training.training_id = training_rate.fk_training_id order by training_rate.number_uses desc limit number);
                END IF;
            END;
            $$ LANGUAGE plpgsql;
        """,
        """
            CREATE OR REPLACE FUNCTION GetExercisesForTraining(train_id integer)
            RETURNS TABLE(training_id integer, training_name varchar(100), training_description text, exercise_id integer, exercise_name varchar(100), exercise_description text)
            AS $$
            BEGIN
                return query (select training.training_id, training.name, training.description, exercise.exercise_id, exercise.name, exercise.description from training
                    join training_exercise on training.training_id = training_exercise.fk_training_id
                    join exercise on training_exercise.fk_exercise_id = exercise.exercise_id
                    WHERE training.training_id = train_id);
            END;
            $$ LANGUAGE plpgsql;
        """,
        """
            CREATE OR REPLACE FUNCTION GetTopPreparations(number integer)
            RETURNS TABLE(preparation_id integer, training_name varchar(100), baa_name varchar(100), preparation_rate double precision)
            AS $$
            BEGIN
                IF number = 0 then
                return query (select preparation.preparation_id, training.name, preparation_baa.complex_name, preparation_rate.effectiveness from preparation
                    join training on preparation.fk_training_id = training.training_id
                    join preparation_baa on preparation.preparation_id = preparation_baa.fk_preparation_id
                    join baa on preparation_baa.fk_baa_id = baa.baa_id
                    join preparation_rate on preparation.preparation_id = preparation_rate.fk_preparation_id
                    order by preparation_rate.effectiveness desc);
                ELSE
                return query (select preparation.preparation_id, training.name, preparation_baa.complex_name, preparation_rate.effectiveness from preparation
                    join training on preparation.fk_training_id = training.training_id
                    join preparation_baa on preparation.preparation_id = preparation_baa.fk_preparation_id
                    join baa on preparation_baa.fk_baa_id = baa.baa_id
                    join preparation_rate on preparation.preparation_id = preparation_rate.fk_preparation_id
                    order by preparation_rate.effectiveness desc limit number);
                END IF;
            END;
            $$ LANGUAGE plpgsql;
        """,
        """
            CREATE OR REPLACE FUNCTION GetInfoAboutPreparation(prep_id integer)
            RETURNS TABLE(preparation_id integer, training_id integer, training_name varchar(100), training_description text, baa_id integer, baa_name varchar(100), baa_desc text, preparation_rating double precision)
            AS $$
            BEGIN
                return query (select preparation.preparation_id, training.training_id, training.name, training.description, baa.baa_id, baa.name, baa.description, preparation_rate.effectiveness from preparation
                    join training on preparation.fk_training_id = training.training_id
                    join baa on preparation.fk_baa_id = baa.baa_id
                    join preparation_rate on preparation.preparation_id = preparation_rate.fk_preparation_id
                    where preparation.preparation_id = prep_id);
            END;
            $$ LANGUAGE plpgsql;
        """,
        """
            CREATE OR REPLACE FUNCTION GetCompetitionsForSportsman(person_id integer)
            RETURNS TABLE(sportsman_id integer, competition_id integer, competition_name varchar(100), competition_date date, competition_place varchar(100), competition_prestige smallint, sport_id integer, sport_name varchar(50), preparation_id int, rating_diff smallint)
            AS $$
            BEGIN
                return query (select sportsman.sportsman_id, competition.competition_id, competition.name, competition.date_of_event, competition.place, competition.prestige, sport.sport_id, sport.name, sportsman_competition.fk_preparation_id, sportsman_competition.rating_difference from competition
                    join sportsman_competition on sportsman_competition.fk_competition_id = competition.competition_id
                    join sportsman on sportsman.sportsman_id = sportsman_competition.fk_sportsman_id and sportsman.sportsman_id = person_id
                    join sport on competition.fk_sport_id = sport.sport_id );
            END;
            $$ LANGUAGE plpgsql;
        """,
        """
            CREATE OR REPLACE FUNCTION GetTopSportTeams(sportId integer, number integer)
            RETURNS TABLE(sport_id int, sport_team_id int, sport_team_name varchar(50), sport_team_rate double precision)
            AS $$
            BEGIN
                IF number = 0 THEN
                return query (select sport_team_sport.fk_sport_id, sport_team.sport_team_id, sport_team.name, sport_team.average_rate from sport_team
                    join sport_team_sport on sport_team.sport_team_id = sport_team_sport.fk_sport_team_id and sport_team_sport.fk_sport_id = sportId
                    order by sport_team.average_rate desc);
                ELSE
                return query (select sport_team_sport.fk_sport_id, sport_team.sport_team_id, sport_team.name, sport_team.average_rate from sport_team
                    join sport_team_sport on sport_team.sport_team_id = sport_team_sport.fk_sport_team_id and sport_team_sport.fk_sport_id = sportId
                    order by sport_team.average_rate desc limit number);
                END IF;
            END;
            $$ LANGUAGE plpgsql;
        """,
        """
            CREATE OR REPLACE FUNCTION GetCurrentPreparationsForSportsman(sportsmanId integer)
            RETURNS TABLE(sportsman_id int, sportsman_full_name int, sportsman_sex varchar(50), sportsman_date_of_birth date, sportsman_rate double precision, preparation_id int)
            AS $$
            BEGIN
                return query (select sportsman.sportsman_id, sportsman.full_name, sportsman.sex, sportsman.date_of_birth, sportsman_sport.rate, preparation.preparation_id from sportsman
                    join sportsman_sport on sportsman.sportsman_id = sportsman_sport.fk_sportsman_id and sportsman.sportsman_id = sportsmanId
                    join preparation on sportsman_sport.fk_preparation_id = preparation.preparation_id
                    order by sportsman_sport.rate desc);
            END;
            $$ LANGUAGE plpgsql;
        """
    ]
    for postgresql_func in postgresql_funcs:
        create_func(postgresql_func)

@app.errorhandler(404)
def page_not_found(error):
    return make_response('Нет страницы с указанным url')

if(__name__ == '__main__'):
   app.run(debug=True, port=32456)
   