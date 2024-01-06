-- Процедура get_game_info яка вивовидить інформацію про гру за вказаною назвою гри

DROP PROCEDURE IF EXISTS get_game_info(varchar(250));

CREATE OR REPLACE PROCEDURE get_game_info(game_name varchar(100))
LANGUAGE plpgsql
AS $$
DECLARE record_release game.release%TYPE;
DECLARE record_series game.series%TYPE;
DECLARE record_sales game.sales%TYPE;

BEGIN
	SELECT game.release, game.series, game.sales into record_release, record_series, record_sales
		FROM game WHERE name = game_name;
	RAISE INFO 'Game_release: %, Game_series: %, Game_sales: %',
	TRIM(record_release), TRIM(record_series), record_sales;
END;
$$;

CALL get_game_info('Terraria')
