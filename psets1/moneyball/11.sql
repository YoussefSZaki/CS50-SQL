SELECT "first_name", "last_name", "salary"/"H" AS "dollars per hit" FROM "performances"
JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
JOIN "players" ON "players"."id" = "performances"."player_id"
WHERE "H" > 0 AND "performances"."year" = '2001'
ORDER BY "dollars per hit" ASC, "first_name" ASC, "last_name" ASC
LIMIT 10;
