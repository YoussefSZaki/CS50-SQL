SELECT "first_name", "last_name" FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
ORDER BY "salary" DESC
LIMIT 1;
