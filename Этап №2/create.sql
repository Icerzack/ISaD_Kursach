-- CREATE TYPE sex AS ENUM ('мужчина', 'женщина', 'другое');

CREATE TABLE sport(
    sport_id serial PRIMARY KEY,
    name varchar(50) UNIQUE NOT NULL
);

CREATE TABLE competition(
    competition_id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    fk_sport_id int REFERENCES sport NOT NULL,
    date_of_event date NOT NULL,
    place varchar(100) NOT NULL,
    prestige smallint CHECK (prestige >= 0 and prestige <= 100),
    description text
);

CREATE TABLE doctor(
    doctor_id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    rate int DEFAULT 0
);

CREATE TABLE coach(
    coach_id serial PRIMARY KEY,
    name varchar(50) NOT NULL,
    rate int DEFAULT 0
);

CREATE TABLE sport_team(
    sport_team_id serial PRIMARY KEY,
    name varchar(50) NOT NULL,
    average_rate double precision
);

CREATE TABLE sport_team_sport(
    fk_sport_team_id int REFERENCES sport_team,
    fk_sport_id int REFERENCES sport,
    PRIMARY KEY(fk_sport_team_id, fk_sport_id)
);

CREATE TABLE baa(
    baa_id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    manufacturer varchar(100),
    description text,
    UNIQUE(name, manufacturer, description)
);

CREATE TABLE exercise(
    exercise_id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    description text,
    UNIQUE(name, description)
);

CREATE TABLE training(
    training_id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    description text,
    UNIQUE(name, description)
);

CREATE TABLE training_exercise(
    fk_training_id int REFERENCES training,
    fk_exercise_id int REFERENCES exercise,
    PRIMARY KEY(fk_training_id, fk_exercise_id)
);

CREATE TABLE preparation(
    preparation_id serial PRIMARY KEY,
    fk_baa_id int REFERENCES baa,
    fk_training_id int REFERENCES training,
    UNIQUE(fk_baa_id, fk_training_id)
);

CREATE TABLE sportsman(
    sportsman_id serial PRIMARY KEY,
    full_name varchar(100) NOT NULL,
    sex sex NOT NULL,
    date_of_birth date NOT NULL,
    fk_sport_team_id int REFERENCES sport_team
);

CREATE TABLE personnel(
    fk_sportsman_id int REFERENCES sportsman,
    fk_doctor_id int REFERENCES doctor,
    fk_coach_id int REFERENCES coach,
    PRIMARY KEY(fk_sportsman_id,fk_doctor_id,fk_coach_id)
);

CREATE TABLE sportsman_sport(
    fk_sportsman_id int REFERENCES sportsman,
    fk_sport_id int REFERENCES sport,
    rate int DEFAULT 0,
    fk_preparation_id int REFERENCES preparation,
    PRIMARY KEY(fk_sportsman_id, fk_sport_id)
);

CREATE TABLE sportsman_competition(
    fk_sportsman_id int REFERENCES sportsman,
    fk_competition_id int REFERENCES competition,
    fk_preparation_id int REFERENCES preparation,
    rating_difference smallint DEFAULT 0,
    PRIMARY KEY(fk_sportsman_id, fk_competition_id)
);

CREATE TABLE baa_rate(
     fk_baa_id int PRIMARY KEY REFERENCES baa,
     number_uses int DEFAULT 0,
     all_time_rate_difference int DEFAULT 0
);

CREATE TABLE preparation_rate(
    fk_preparation_id int PRIMARY KEY REFERENCES preparation,
    effectiveness double precision DEFAULT 0.0
);

CREATE TABLE training_rate(
    fk_training_id int PRIMARY KEY REFERENCES training,
    number_uses int DEFAULT 0,
    all_time_rate_difference int DEFAULT 0
);

CREATE TABLE preparation_baa(
    fk_preparation_id int REFERENCES preparation,
    fk_baa_id int REFERENCES baa,
    complex_name varchar(100),
    PRIMARY KEY(fk_preparation_id, fk_baa_id)
);