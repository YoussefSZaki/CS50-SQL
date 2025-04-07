SELECT "first_name" AS "first name above average height", "last_name" AS "last name above average height" 
FROM "players" 
WHERE "height" > (SELECT AVG("height") FROM "players") 
ORDER BY "height" DESC, "first_name" ASC, "last_name" ASC;
