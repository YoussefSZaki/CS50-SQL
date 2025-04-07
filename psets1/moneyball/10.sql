SELECT "first_name", "last_name", "salary", "HR", "performances"."year" FROM "performances"
JOIN "players" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
ORDER BY "players"."id" ASC, "performances"."year" DESC, "HR" DESC, "salary" DESC;
