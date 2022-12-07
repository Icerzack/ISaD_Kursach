create index if not exists baa_id_index
    on baa using hash (baa_id);

create index if not exists training_id_index
    on training using hash(training_id);

create index if not exists sportsman_id_index
    on sportsman using hash (sportsman_id);

create index if not exists sport_team_id_index
    on sport_team using hash (sport_team_id);
