# CS50 SQL Problem Set 0: [Players](https://cs50.harvard.edu/sql/2024/psets/0/players/)

## Problem to Solve

If you’re not familiar, baseball is a popular sport in which two teams of 9 players take turns batting (hitting a ball) and fielding (catching and throwing hit balls). Points (“runs”) are scored when a hitting team’s player hits a ball and eventually touches all bases before the fielding team’s players have the chance to get them “out.” Baseball is arguably most popular in the United States and Canada, where the MLB (Major League Baseball) has served as the professional association for players since 1876.

In a database called players.db, using a table called players, answer questions about MLB players who’ve played from 1871 to 2023.

## Complete Questions

### 1. Write a SQL query to find the hometown (including city, state, and country) of Jackie Robinson.
```sql
SELECT "birth_city", "birth_state", "birth_country" FROM "players" WHERE "first_name" = 'Jackie' AND "last_name" = 'Robinson';
```

### 2. Write a SQL query to find the side (e.g., right or left) Babe Ruth hit.
```sql
SELECT "bats" FROM "players" WHERE "first_name" = 'Babe' AND "last_name" = 'Ruth';
```

### 3. Write a SQL query to find the ids of rows for which a value in the column debut is missing.
```sql
SELECT "id" FROM "players" WHERE "debut" IS NULL;
```

### 4. Write a SQL query to find the first and last names of players who were not born in the United States. Sort the results alphabetically by first name, then by last name.
```sql
SELECT "first_name", "last_name" FROM "players" WHERE "birth_country" != 'USA' ORDER BY "first_name" ASC, "last_name" ASC ;
```

### 5. Write a SQL query to return the first and last names of all right-handed batters. Sort the results alphabetically by first name, then by last name.
```sql
SELECT "first_name", "last_name" FROM "players" WHERE "bats" = 'R' ORDER BY "first_name" ASC, "last_name" ASC;
```

### 6. Write a SQL query to return the first name, last name, and debut date of players born in Pittsburgh, Pennsylvania (PA). Sort the results first by debut date—from most recent to oldest—then alphabetically by first name, followed by last name.
```sql
SELECT "first_name", "last_name", "debut" FROM "players" 
WHERE "birth_city" = 'Pittsburgh' AND "birth_state" = 'PA' 
ORDER BY "debut" DESC, "first_name" ASC, "last_name" ASC;
```

### 7. Write a SQL query to count the number of players who bat (or batted) right-handed and throw (or threw) left-handed, or vice versa.
```sql
SELECT COUNT("first_name") AS "count" FROM "players" 
WHERE "bats" = 'R' AND "throws" = 'L' OR "bats" = 'L' AND "throws" = 'R';
```

### 8. Write a SQL query to find the average height and weight, rounded to two decimal places, of baseball players who debuted on or after January 1st, 2000. Return the columns with the name “Average Height” and “Average Weight”, respectively.
```sql
SELECT ROUND(AVG("height"), 2) AS "Average Height", ROUND(AVG("weight"), 2) AS "Average Weight" 
FROM "players" WHERE "debut" > '2000-01-01';
```

### 9. Write a SQL query to find the players who played their final game in the MLB in 2022. Sort the results alphabetically by first name, then by last name.
```sql
SELECT "first_name", "last_name" FROM "players" 
WHERE "final_game" LIKE "2022-%" 
ORDER BY "first_name" ASC, "last_name" ASC;
```

### 10. write SQL query to answer a question of your choice. This query should:
### A. Make use of AS to rename a column
### B. Involve at least condition, using WHERE
### C. Sort by at least one column using ORDER BY
```sql
SELECT "first_name" AS "first name above average height", "last_name" AS "last name above average height" 
FROM "players" 
WHERE "height" > (SELECT AVG("height") FROM "players") 
ORDER BY "height" DESC, "first_name" ASC, "last_name" ASC;
```

