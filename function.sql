-- Функція, що повертає дані про ігри з найбільшою кількістю копій

DROP FUNCTION IF EXISTS get_info_bestseller_games();

CREATE OR REPLACE FUNCTION get_info_bestseller_games()
	RETURNS TABLE (name varchar, series text, sales integer)
LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY
		SELECT game.name::varchar, game.series::text, game.sales::integer
		FROM game
		WHERE game.sales >= 20;
END;
$$;

SELECT * FROM get_info_bestseller_games();
