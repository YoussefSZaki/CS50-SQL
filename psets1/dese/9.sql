SELECT "name" FROM "districts" WHERE "id" IN (
  SELECT "district_id" FROM "expenditures" 
  GROUP BY "district_id" 
  ORDER BY "pupils" LIMIT 1
);
