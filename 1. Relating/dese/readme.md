# CS50 SQL Problem Set 1: [DESE](https://cs50.harvard.edu/sql/2024/psets/1/dese/)

## Problem to Solve
You just landed a new job as a data analyst for the State of Massachusetts, working within the Department of Elementary and Secondary Education (or DESE, for short!). DESE oversees the state’s public education system. One responsibility of DESE is to ensure every child has a quality education—one in which they encounter experienced teachers, have access to an abundance of resources, and ultimately graduate having met all requirements of the state. Your SQL skills have a part to play in these lofty goals!

In a database called dese.db, answer questions about the state of education in Massachusetts.

## Complete Questions

### 1. Write a SQL query to find the names and cities of all public schools in Massachusetts.
```sql
SELECT "name", "city" FROM "schools" WHERE "type" = 'Public School';
```

### 2. Write a SQL query to find the names of districts that are no longer operational.
```sql
SELECT "name" FROM "districts" WHERE "name" LIKE "%(non-op)";
```

### 3. Write a SQL query to find the average per-pupil expenditure. Name the column “Average District Per-Pupil Expenditure”.
```sql
SELECT ROUND(AVG("per_pupil_expenditure"), 2) AS "Average District Per-Pupil Expenditure" FROM "expenditures";
```

### 4. Write a SQL query to find the 10 cities with the most public schools. Your query should return the names of the cities and the number of public schools within them, ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.
```sql
SELECT "city", COUNT("name") AS "count" FROM "schools" 
WHERE "type" = 'Public School' 
GROUP BY "city" 
ORDER BY "count" DESC , "city" ASC LIMIT 10;
```

### 5. Write a SQL query to find cities with 3 or fewer public schools. Your query should return the names of the cities and the number of public schools within them, ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.
```sql
SELECT "city", COUNT("name") AS "count" FROM "schools" 
WHERE "type" = 'Public School' 
GROUP BY "city" HAVING "count" <= 3 
ORDER BY "count" DESC , "city" ASC ;
```

### 6. Write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.
```sql
SELECT "name" FROM "schools" 
WHERE "id" IN (
  SELECT "school_id" FROM "graduation_rates" WHERE "graduated" = 100
);
```

### 7. Write a SQL query to find the names of schools (public or charter!) in the Cambridge school district. Keep in mind that Cambridge, the city, contains a few school districts, but DESE is interested in the district whose name is “Cambridge.”
```sql
SELECT "name" FROM "schools" 
WHERE "district_id" IN (
  SELECT "id" FROM "districts" 
  WHERE "name" = "Cambridge"
);
```

### 8. Write a SQL query to display the names of all school districts and the number of pupils enrolled in each.
```sql
SELECT "name", "pupils" FROM "districts" 
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id";
```

### 9. Write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).
```sql
SELECT "name" FROM "districts" WHERE "id" IN (
  SELECT "district_id" FROM "expenditures" 
  GROUP BY "district_id" 
  ORDER BY "pupils" LIMIT 1
);
```

### 10. Write a SQL query to find the 10 public school districts with the highest per-pupil expenditures. Your query should return the names of the districts and the per-pupil expenditure for each. 
```sql
SELECT "name", "per_pupil_expenditure" FROM "districts" 
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id" 
WHERE "type" = 'Public School District' 
ORDER BY "per_pupil_expenditure" DESC 
LIMIT 10;
```

### 11. Write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate. Sort the schools from greatest per-pupil expenditure to least. If two schools have the same per-pupil expenditure, sort by school name.
```sql
SELECT "name", "per_pupil_expenditure", "graduated" FROM "schools" 
JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id" 
JOIN "expenditures" ON "expenditures"."district_id" = "schools"."district_id" 
ORDER BY "per_pupil_expenditure" DESC, "name" ASC;
```

### 12. Write a SQL query to find public school districts with above-average per-pupil expenditures and an above-average percentage of teachers rated “exemplary”. Your query should return the districts’ names, along with their per-pupil expenditures and percentage of teachers rated exemplary. Sort the results first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).
```sql
SELECT "name", "per_pupil_expenditure", "exemplary" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id" 
WHERE "type" = 'Public School District' 
AND "per_pupil_expenditure" > (SELECT AVG("per_pupil_expenditure") FROM "expenditures") 
AND "exemplary" > (SELECT AVG("exemplary") FROM "staff_evaluations")
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;
```

### 13. Write a SQL query to answer a question you have about the data!
**The query should involve at least one JOIN or subquery**
```sql
SELECT "name", "dropped", "per_pupil_expenditure" FROM "schools"
JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id"
JOIN "expenditures" ON "expenditures"."district_id" = "schools"."district_id"
ORDER BY "per_pupil_expenditure" ASC, "dropped" DESC;
```
