INSERT INTO sport(name)
VALUES
    ('Плавание'),
    ('Бадминтон'),
    ('Настольный теннис'),
    ('Каратэ'),
    ('Шахматы'),
    ('Футбол'),
    ('Баскетбол'),
    ('Большой теннис'),
    ('Бокс'),
    ('Бобслей'),
    ('Волейбол'),
    ('Гольф'),
    ('Гребля'),
    ('Горнолыжный спорт'),
    ('Дартс'),
    ('Джиу-джитсу'),
    ('Конкур'),
    ('Кудо'),
    ('Кёрлинг'),
    ('Конное троеборье'),
    ('Кикбоксинг'),
    ('Лапта'),
    ('Лыжные гонки'),
    ('Легкая атлетика'),
    ('Парусный спорт'),
    ('Регби'),
    ('Рукопашный бой'),
    ('Пляжный футбол'),
    ('Тхэквондо');

INSERT INTO competition(name, fk_sport_id, date_of_event, place, prestige, description)
VALUES
    ('Чемпионат СПб', 1, '2017-03-14', 'Вяземский переулок 5', 90, 'Офигеть какой важный турнир'),
    ('Соревнование среди двора дома №13', 2, '1999-12-31', 'Улица Пушкина 1837', 1, 'Отмывание денег за капитальный ремонт'),
    ('Кубок СПб', 3, '2020-05-30', 'Думская', 70, 'Почти офигеть какой важный турнир'),
    ('Чемпионат города Москва', 4, '2024-12-14', 'Вяземский переулок 5', 90, 'Офигеть какой важный турнир'),
    ('Соревнование среди юниоров СПб', 5, '1989-03-15', 'Жулин переулок 1', 90, 'Офигеть какой важный турнир'),
    ('Состязание самых умных', 6, '1415-06-16', 'Гагаринский проспект 2', 90, 'Офигеть какой важный турнир'),
    ('Чемпионат Рязани', 7, '1950-07-17', 'Олимпийский проспект 3', 90, 'Офигеть какой важный турнир'),
    ('Турнир трех волшебников', 8, '1951-08-18', 'Гривцова улица 4', 90, 'Офигеть какой важный турнир'),
    ('Международный конгресс молодых ученых', 9, '1952-09-19', 'Беллорусская улици 5', 90, 'Офигеть какой важный турнир'),
    ('Состязание Новгорода', 10, '1953-10-20', 'Чкаловский переулок 6', 90, 'Офигеть какой важный турнир'),
    ('Собрание Новочеркасска', 11, '1954-11-21', 'Репина переулок 7', 90, 'Офигеть какой важный турнир'),
    ('Сореврнование Севастополя', 12, '1955-12-22', 'Мясных переулок 8', 90, 'Офигеть какой важный турнир'),
    ('Гордость Мухосранска', 13, '1956-01-23', 'Тильтова улица 9', 90, 'Офигеть какой важный турнир'),
    ('Честь и отвага', 14, '1957-02-24', 'Сверчков проспект 10', 90, 'Офигеть какой важный турнир'),
    ('Я люблю спорт!', 15, '1958-03-25', 'Кронверкский проспект 11', 90, 'Офигеть какой важный турнир'),
    ('Чемпионат СПб', 16, '1959-04-26', 'Петроградский переулок 12', 90, 'Офигеть какой важный турнир'),
    ('Чемпионат Вольного переулка', 17, '1960-05-27', 'Вольный переулок 13', 90, 'Офигеть какой важный турнир'),
    ;

INSERT INTO doctor(name, rate)
VALUES
    ('Петров Владимир Ильич', 100),
    ('Иванов Ильяс Альбертович', 50),
    ('Кукмаков Андрей Викторович', 70);

INSERT INTO coach(name, rate)
VALUES
    ('Салимов Олег Дмитриевич', 80),
    ('Полюсов Владимир Алексеевич', 150),
    ('Золотов Виктор Геннадиевич', 60);

INSERT INTO sport_team(name, average_rate)
VALUES
    ('Белые Медведи', 1200.98),
    ('Черные лошади', 1300.11),
    ('Зеленые крокодилы', 1700.14),
    ('Красные ежики', 1450.12),
    ('Оранжевые попугаи', 1368),
    ('Синие львы', 1421.24);

INSERT INTO baa(name, manufacturer, description)
VALUES
    ('bcaa', 'MegaPower', 'Принимайте до и после тренировки, будут руки базуки'),
    ('протеиновый батончик', 'Mega Power', 'Дорого, но вкусно'),
    ('изотоник', 'Super sportsman', 'Принимайте во время тренировки для восстановления водо-солевого баланса');

INSERT INTO exercise(name, description)
VALUES
    ('Отжимания', '5 подходов по 50 раз с отдыхом в 2 минуты между подходами'),
    ('Подтягивания', '5 подходов по 5 раз с отдыхом в 1.5 минуты между подходами'),
    ('Приседания', '10 подходов по 30 раз с отдыхом в 1 минуту между подходами');

INSERT INTO training(name, description)
VALUES
    ('Комплекс Болгарова', 'можно выполнять хоть каждый день'),
    ('Завтра не встанешь', 'не рекомендуется выполнять чаще 2-3 раз в неделю'),
    ('Треш, кровь и пот', 'Если вы не профессиональный спортсмен, то подумайте еще раз, надо ли вам оно?');

INSERT INTO training_exercise(fk_training_id, fk_exercise_id)
VALUES
    (1, 2),
    (2, 1),
    (2, 2),
    (3, 1),
    (3, 2),
    (3, 3);

INSERT INTO preparation(complex_name)
VALUES
    ('Этот комплекс самый лучший комплекс на Земле'),
    ('Из грязи в Викинги'),
    ('Спартанцы плачут по таким комплексам');

INSERT INTO sportsman(full_name, sex, date_of_birth)
VALUES
    ('Бсэйн Уолт', 'мужчина', '1985-09-12'),
    ('Риштиану Коналду', 'мужчина', '2010-03-11'),
    ('Мерилин Монор', 'женщина', '2000-08-25');

INSERT INTO personnel(fk_sportsman_id, fk_doctor_id, fk_coach_id)
VALUES
    (1,2,3),
    (2,1,2),
    (3,3,1);

INSERT INTO sportsman_sport(fk_sportsman_id, fk_sport_id, rate, fk_preparation_id)
VALUES
    (1, 2, 1800, 1),
    (2, 3, 2300, 2),
    (3, 1, 1975, 3);

INSERT INTO sportsman_competition(fk_sportsman_id, fk_competition_id, fk_preparation_id, rating_difference)
VALUES
    (1, 3, 3, 10),
    (2, 2, 2, 5),
    (2, 3, 1, -3),
    (3, 1, 2, 2);

INSERT INTO sport_team_sport(fk_sport_team_id, fk_sport_id, fk_sportsman_id)
VALUES
    (1, 2, 1),
    (2, 2, 2),
    (3, 1, 1),
    (4, 3, 3),
    (5, 1, 3),
    (6, 3, 2);

INSERT INTO baa_rate(fk_baa_id, number_uses, all_time_rate_difference)
VALUES
    (1, 764, 458),
    (2, 533, -142),
    (3, 125, 50);

INSERT INTO preparation_rate(fk_preparation_id, effectiveness)
VALUES
    (1, 420),
    (2, 100),
    (3, -390);

INSERT INTO training_rate(fk_training_id, number_uses, all_time_rate_difference)
VALUES
    (1, 17, 92),
    (2, 391, 88),
    (3, 1192, 1425);

INSERT INTO preparation_baa(fk_preparation_id, fk_baa_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 3),
    (3, 1),
    (3, 2);

INSERT INTO preparation_training(fk_preparation_id, fk_training_id)
VALUES
    (1, 2),
    (1, 3),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 3);