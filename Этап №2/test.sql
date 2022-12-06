SELECT sportsman_id, full_name, rate from sportsman;
SELECT doctor_id, name, rate from doctor;
SELECT coach_id, name, rate from coach;
SELECT * from baa_rate;
select * from personnel;

SELECT * from sportsman_competition;

INSERT INTO sportsman_competition(fk_sportsman_id, fk_competition_id, fk_preparation_id, rating_difference)
VALUES
    (1, 1, 2, 1000);

UPDATE sportsman_competition SET rating_difference = -150
                             WHERE fk_sportsman_id = 1 and fk_competition_id = 1 and fk_preparation_id = 2
