--Даний тригер переводить нові введені дані у верхній регістр

-- Видаляємо тригер якщо такий вже існує
-- DROP TRIGGER IF EXISTS upper_insert ON game;

-- Створюємо тригерну функція
CREATE OR REPLACE FUNCTION upper_insert_data() RETURNS trigger
LANGUAGE 'plpgsql'
AS
$$
BEGIN
	UPDATE game SET name = upper(name), release = upper(release)
	WHERE game.game_id = NEW.game_id;
	RETURN NULL;
END;
$$;

-- Власне, створення тригеру
CREATE TRIGGER upper_insert
AFTER INSERT ON game
FOR EACH ROW EXECUTE FUNCTION upper_insert_data();

-- додаєм відповідні значення у таблиці, в результаті нові дані мають перевестись у верхній регістр
insert into developer(developer_id, name) values(11, 'none');
insert into publisher(publisher_id, name) values(11, 'none');
insert into game(game_id, name, sales, series, release, developer_id, publisher_id) values(11, 'Doom', 25, null, 'Dec-10', 11, 11);
insert into game_genre(genre, genre_id, game_id) values('none', 12, 11);

-- select * from game;
