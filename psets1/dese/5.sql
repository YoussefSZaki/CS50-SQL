SELECT "city", COUNT("name") AS "count" FROM "schools" 
WHERE "type" = 'Public School' 
GROUP BY "city" HAVING "count" <= 3 
ORDER BY "count" DESC , "city" ASC ;
