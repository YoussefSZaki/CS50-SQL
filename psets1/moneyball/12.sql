SELECT "first_name", "last_name" FROM "players" WHERE "id" IN (
    SELECT "player_id" FROM (
        SELECT "performances"."player_id" FROM "performances"
        JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
        JOIN "players" ON "players"."id" = "performances"."player_id"
        WHERE "H" > 0 AND "performances"."year" = 2001
        ORDER BY "salary"/"H" ASC
        LIMIT 10
        ) AS 'cheap hits'
INTERSECT
    SELECT "player_id" FROM (
        SELECT "performances"."player_id" FROM "performances"
        JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
        JOIN "players" ON "players"."id" = "performances"."player_id"
        WHERE "RBI" > 0 AND "performances"."year" = 2001
        ORDER BY "salary"/"RBI" ASC
        LIMIT 10
        ) AS 'cheap rbis'
)
ORDER BY "id" ASC, "last_name" ASC;
