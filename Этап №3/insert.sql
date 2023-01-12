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
    ('Соревнование Севастополя', 12, '1955-12-22', 'Мясных переулок 8', 90, 'Офигеть какой важный турнир'),
    ('Гордость Мухосранска', 13, '1956-01-23', 'Тильтова улица 9', 90, 'Офигеть какой важный турнир'),
    ('Честь и отвага', 14, '1957-02-24', 'Сверчков проспект 10', 90, 'Офигеть какой важный турнир'),
    ('Я люблю спорт!', 15, '1958-03-25', 'Кронверкский проспект 11', 90, 'Офигеть какой важный турнир'),
    ('Чемпионат СПб', 16, '1959-04-26', 'Петроградский переулок 12', 90, 'Офигеть какой важный турнир'),
    ('Чемпионат Вольного переулка', 17, '1960-05-27', 'Вольный переулок 13', 90, 'Офигеть какой важный турнир');

INSERT INTO doctor(name, rate)
VALUES
    ('Петров Владимир Ильич', 100),
    ('Иванов Ильяс Альбертович', 50),
    ('Иванова Валентина Васильевна', 50),
    ('Буренева Елена Павловна', 50),
    ('Гаврилова Елена Петровна', 50),
    ('Васильева Нина Сергеевна', 50),
    ('Истомина Светлана Александровна', 50),
    ('Хаджиониди Евгения Николаевна', 50),
    ('Алпатова Мария Михайловна', 50),
    ('Сорвина Ирина Васильевна', 50),
    ('Старостина Ирина Васильевна', 50),
    ('Урбина Екатерина Александровна', 50),
    ('Кукмаков Андрей Викторович', 70);

INSERT INTO coach(name, rate)
VALUES
    ('Салимов Олег Дмитриевич', 80),
    ('Полюсов Владимир Алексеевич', 150),
    ('Афанасьева Надежда Сергеевна', 150),
    ('Голубева Анна Алексеевна', 150),
    ('Алексеева Ольга Николаевна', 150),
    ('Бельская Раиса Александровна', 150),
    ('Степанова Надежда Анатольевна', 150),
    ('Тимохин Евгений Анатольевич', 150),
    ('Горбачева Ирина Владимировна', 150),
    ('Золотов Виктор Геннадиевич', 60);

INSERT INTO sport_team(name, average_rate)
VALUES
    ('Белые Медведи', 1200.98),
    ('Черные лошади', 1300.11),
    ('Зеленые крокодилы', 1700.14),
    ('Красные ежики', 1450.12),
    ('Оранжевые попугаи', 1368),
    ('Апельсиновые барсы', 1468),
    ('Клубничные машины', 1358),
    ('Ананасовые победители', 2168),
    ('Спарта', 1038),
    ('Синие львы', 1421.24);

INSERT INTO baa(name, manufacturer, description)
VALUES
    ('bcaa', 'Mega Power', 'Принимайте до и после тренировки, будут руки базуки'),
    ('bcaa', 'Super Power', 'Принимайте до и после тренировки, будут руки базуки'),
    ('bcaa', 'Maxvel', 'Принимайте до и после тренировки, будут руки базуки'),
    ('bcaa', 'Sport Without Politician', 'Принимайте до и после тренировки, будут руки базуки'),
    ('bcaa', 'Ням-Ням', 'Принимайте до и после тренировки, будут руки базуки'),
    ('протеиновый батончик', 'Mega Power', 'Дорого, но вкусно'),
    ('протеиновый батончик', 'Hard Power', 'Дорого, невкусно, зато результат хороший'),
    ('протеиновый батончик', 'For all', 'Дорого, без результата, зато вкусно'),
    ('протеиновый батончик', 'Easy Peasy', 'Дешево, результат класс, без вкуса'),
    ('протеиновый батончик', 'Like superman', 'Результат сделает из вас самых сильных'),
    ('протеиновый батончик', 'Cheet code baa', 'Агуша не поможет также хорошо'),
    ('изотоник', 'Super sportsman', 'Принимайте во время тренировки для восстановления водо-солевого баланса'),
    ('изотоник', 'Super girl', 'Строго для феминисток'),
    ('изотоник', 'Super child', 'Тягаем штангу 100кг уже с дошкольного возраста');

INSERT INTO exercise(name, description)
VALUES
    ('Отжимания', '5 подходов по 50 раз с отдыхом в 2 минуты между подходами'),
    ('Подтягивания', '5 подходов по 5 раз с отдыхом в 1.5 минуты между подходами'),
    ('Выпрыгивания', '5 подходов по 5 раз с отдыхом в 1.5 минуты между подходами'),
    ('Берпи', '5 подходов по 5 раз с отдыхом в 1.5 минуты между подходами'),
    ('Пресс скручивания', '5 подходов по 5 раз с отдыхом в 1.5 минуты между подходами'),
    ('Разножка', '5 подходов по 5 раз с отдыхом в 1.5 минуты между подходами'),
    ('Многоскоки', '5 подходов по 5 раз с отдыхом в 1.5 минуты между подходами'),
    ('Челночный бег', '5 подходов по 5 раз с отдыхом в 1.5 минуты между подходами'),
    ('Движение гуськом', '5 подходов по 5 раз с отдыхом в 1.5 минуты между подходами'),
    ('Приседания', '10 подходов по 30 раз с отдыхом в 1 минуту между подходами');

INSERT INTO training(name, description)
VALUES
    ('Комплекс Болгарова', 'можно выполнять хоть каждый день'),
    ('Завтра не встанешь', 'не рекомендуется выполнять чаще 2-3 раз в неделю'),
    ('Тренировочный комплекс студента ИТМО', 'рекомендуется выполнять минимум 3 раза в неделю'),
    ('Тренировочный комплекс студента МГУ', 'рекомендуется выполнять минимум 3 раза в неделю'),
    ('Тренировочный комплекс студента МФТИ', 'рекомендуется выполнять минимум 3 раза в неделю'),
    ('Тренировочный комплекс студента СПБГУ', 'рекомендуется выполнять минимум 3 раза в неделю'),
    ('Тренировочный комплекс студента СПБГЭУ', 'рекомендуется выполнять минимум 3 раза в неделю'),
    ('Тренировочный комплекс студента МИФИ', 'рекомендуется выполнять минимум 3 раза в неделю'),
    ('Тренировочный комплекс студента ВОЕНМЕХА', 'рекомендуется выполнять минимум 3 раза в неделю'),
    ('Треш, кровь и пот', 'Если вы не профессиональный спортсмен, то подумайте еще раз, надо ли вам оно?');

INSERT INTO training_exercise(fk_training_id, fk_exercise_id)
VALUES
    (1, 2),
    (2, 1),
    (2, 2),
    (3, 1),
    (3, 2),
    (4, 5),
    (4, 7),
    (5, 6),
    (7, 8),
    (4, 8),
    (5, 3),
    (6, 1),
    (7, 2),
    (8, 5),
    (9, 7),
    (10, 6),
    (6, 8),
    (7, 4),
    (8, 3),
    (10, 3);

INSERT INTO preparation(complex_name)
VALUES
    ('Этот комплекс самый лучший комплекс на Земле'),
    ('Из грязи в Викинги'),
    ('Из грязи в моряки'),
    ('Из грязи в ВДВ'),
    ('Из грязи в князи'),
    ('Из грязи в крутых чуваков'),
    ('Из грязи в майоры'),
    ('Из грязи в полковники'),
    ('Спартанцы плачут по таким комплексам');

INSERT INTO login_password(login, password)
VALUES
    ('me1', 'lalala'),
    ('me2', 'lalala'),
    ('me3', 'lalala'),
    ('me4', 'lalala'),
    ('me5', 'lalala'),
    ('me6', 'lalala'),
    ('me7', 'lalala'),
    ('me8', 'lalala'),
    ('me9', 'lalala'),
    ('me10', 'lalala');

INSERT INTO sportsman_login(sportsman_id, login)
VALUES
    (1, 'me1'),
    (2, 'me2'),
    (3, 'me3'),
    (4, 'me4'),
    (5, 'me5'),
    (6, 'me6'),
    (7, 'me7'),
    (8, 'me8'),
    (9, 'me9'),
    (10, 'me10');

INSERT INTO sportsman(sportsman_id, full_name, sex, date_of_birth, fk_sport_team_id)
VALUES
    (1, 'Бсэйн Уолт', 'мужчина', '1985-09-12', 1),
    (2, 'Риштиану Коналду', 'мужчина', '2010-03-11', 1),
    (3, 'Шнионель Шмесси', 'мужчина', '1987-09-12', 1),
    (4, 'Ангелина Пушка', 'женщина', '2010-03-11', 1),
    (5, 'Вероника Огонь', 'женщина', '1985-09-12', 2),
    (6, 'Татьяна Шпагатовна', 'женщина', '2010-03-11', 2),
    (7, 'Александр Почтиневский', 'мужчина', '1985-09-12', 2),
    (8, 'Конфуций Дмитриев', 'мужчина', '2010-03-11', 3),
    (9, 'Малон Иск', 'мужчина', '1985-09-12', 4),
    (10,'Мерилин Монор', 'женщина', '2000-08-25', 5);

INSERT INTO personnel(fk_sportsman_id, fk_doctor_id, fk_coach_id)
VALUES
    (1,2,3),
    (2,1,2),
    (1,3,5),
    (3,4,4),
    (4,5,2),
    (5,3,5),
    (6,5,5),
    (7,1,2),
    (8,3,3),
    (9,3,1);

INSERT INTO sportsman_sport(fk_sportsman_id, fk_sport_id, rate, fk_preparation_id)
VALUES
    (1, 2, 1800, 1),
    (2, 13, 2100, 2),
    (3, 8, 2400, 3),
    (4, 7, 2200, 6),
    (5, 16, 1300, 5),
    (6, 2, 1600, 3),
    (7, 4, 1800, 4),
    (8, 5, 2000, 1),
    (9, 6, 2100, 2),
    (10, 11, 1975, 3);

INSERT INTO sportsman_competition(fk_sportsman_id, fk_competition_id, fk_preparation_id, rating_difference)
VALUES
    (1, 3, 3, 10),
    (2, 2, 2, 5),
    (2, 3, 1, -3),
    (3, 3, 3, 10),
    (3, 2, 2, 5),
    (4, 3, 3, 10),
    (4, 2, 2, 5),
    (5, 3, 3, 10),
    (5, 2, 2, 5),
    (6, 3, 3, 10),
    (6, 2, 2, 5),
    (6, 4, 1, -3),
    (7, 3, 3, 10),
    (7, 2, 2, 5),
    (7, 5, 1, -3);

INSERT INTO sport_team_sport(fk_sport_team_id, fk_sport_id, fk_sportsman_id)
VALUES
    (1, 2, 1),
    (2, 8, 2),
    (3, 7, 1),
    (4, 6, 3),
    (5, 5, 3),
    (6, 3, 5),
    (5, 5, 6),
    (3, 12, 3),
    (4, 15, 3),
    (6, 3, 2);

INSERT INTO baa_rate(fk_baa_id, number_uses, all_time_rate_difference)
VALUES
    (1, 764, 458),
    (2, 533, 0),
    (3, 267, 0),
    (4, 333, 0),
    (5, 932, 42),
    (6, 162, 321),
    (7, 734, 0),
    (8, 127, 0),
    (9, 635, -11),
    (10, 832, 50);

INSERT INTO preparation_rate(fk_preparation_id, effectiveness)
VALUES
    (1, 420),
    (2, 172),
    (3, 372),
    (4, 271),
    (5, 175),
    (6, 274),
    (7, 924),
    (8, 842),
    (9, 714);

INSERT INTO training_rate(fk_training_id, number_uses, all_time_rate_difference)
VALUES
    (1, 17, 92),
    (2, 391, 88),
    (3, 1192, 1425),
    (4, 721, 284),
    (5, 821, -214),
    (6, 73, -12),
    (7, 2813, 0),
    (8, 2184, 841),
    (9, 1824, 278);

INSERT INTO preparation_baa(fk_preparation_id, fk_baa_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 3),
    (3, 1),
    (4, 2),
    (5, 5),
    (6, 4),
    (7, 3),
    (8, 2),
    (3, 3),
    (6, 1),
    (3, 2);

INSERT INTO preparation_training(fk_preparation_id, fk_training_id)
VALUES
    (1, 2),
    (1, 3),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 2),
    (4, 1),
    (5, 2),
    (6, 4),
    (7, 5),
    (7, 6),
    (6, 2),
    (5, 3);