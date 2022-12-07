-- test 1
INSERT INTO sportsman_competition(fk_sportsman_id, fk_competition_id, fk_preparation_id, rating_difference)
VALUES
    (1, 2, 2, 10000);
SELECT * from sportsman_sport;
SELECT * from personnel;
SELECT doctor_id, name, rate from doctor;
SELECT coach_id, name, rate from coach;
SELECT * from preparation_baa;
SELECT * from baa_rate;
SELECT * from preparation_training;
SELECT * from training_rate;

UPDATE sportsman_competition SET rating_difference = -15000
                             WHERE fk_sportsman_id = 1 and fk_competition_id = 2 and fk_preparation_id = 2;
SELECT * from sportsman_sport;
SELECT * from personnel;
SELECT doctor_id, name, rate from doctor;
SELECT coach_id, name, rate from coach;
SELECT * from preparation_baa;
SELECT * from baa_rate;
SELECT * from preparation_training;
SELECT * from training_rate;

------------------------------------------------------------------------------------------------------------------------
-- test 2
INSERT INTO sportsman_sport(fk_sportsman_id, fk_sport_id, rate, fk_preparation_id)
VALUES
    (2, 2, 1300, 3);
SELECT * from preparation_baa;
SELECT * from baa_rate;
SELECT * from preparation_training;
SELECT * from training_rate;

------------------------------------------------------------------------------------------------------------------------
-- test 3
UPDATE baa_rate SET all_time_rate_difference = 100000
                WHERE fk_baa_id = 2;
SELECT * from preparation_rate;
select * from preparation_baa;

UPDATE training_rate SET all_time_rate_difference = -100000
                WHERE fk_training_id = 2;
SELECT * from preparation_rate;
select * from preparation_training;