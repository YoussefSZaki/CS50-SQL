SELECT "city", COUNT("name") AS "count" FROM "schools" 
WHERE "type" = 'Public School' 
GROUP BY "city" 
ORDER BY "count" DESC , "city" ASC LIMIT 10;
