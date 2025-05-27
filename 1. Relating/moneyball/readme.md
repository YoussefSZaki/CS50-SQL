# CS50 SQL Problem Set 1: [Moneyball](https://cs50.harvard.edu/sql/2024/psets/1/moneyball/)

## Problem to Solve
The year is 2001. You’ve been hired to help make the most of the Oakland Athletics baseball team’s dwindling player budget. Each year, teams like the “A’s” hire new baseball players. Unfortunately, you’re low on star players—and on funds. Though, with a bit of SQL and some luck, who says you can’t still create a team that defies expectations?

Given a database called moneyball.db—one that contains information on players, their performances, and their salaries—help the Oakland Athletics find the value in players others might miss.

## Complete Questions

### 1. Write a SQL query to find the average player salary by year.
**a.** Sort by year in descending order.  
**b.** Round the salary to two decimal places and call the column “average salary”.  
**c.** Your query should return a table with two columns, one for year and one for average salary.  
```sql
SELECT ROUND(AVG("salary"), 2) AS "average salary", "year" FROM "salaries" 
GROUP BY "year" 
ORDER BY "year" DESC;
```

### 2. Write a SQL query to find Cal Ripken Jr.’s salary history.
**a.** Sort by year in descending order.  
**b.** Your query should return a table with two columns, one for year and one for salary.  
```sql
SELECT "salary", "year" FROM "salaries" WHERE "player_id" = (
    SELECT "id" FROM "players"
    WHERE "first_name" = 'Cal' AND "last_name" = 'Ripken'
)
ORDER BY "year" DESC;
```

### 3. Write a SQL query to find Ken Griffey Jr.’s home run history.
**a.** Sort by year in descending order.  
**b.** Your query should return a table with two columns, one for year and one for home runs.  
```sql
SELECT "year", "HR" AS "home runs" FROM "performances" WHERE "player_id" = (
  SELECT "id" FROM "players" 
  WHERE "first_name" = 'Ken' AND "last_name" = 'Griffey' AND "birth_year" = 1969
)
ORDER BY "year" DESC;
```

### 4. Write a SQL query to find the 50 players paid the least in 2001.
**a.** Sort players by salary, lowest to highest.  
**b.** If two players have the same salary, sort alphabetically by first name and then by last name.  
**c.** If two players have the same first and last name, sort by player ID.  
**d.** Your query should return three columns, one for players’ first names, one for their last names, and one for their salaries.  
```sql
SELECT "first_name", "last_name", "salary" FROM "players"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "year" = 2001
ORDER BY "salary" ASC, "first_name" ASC, "last_name" ASC, "player_id" ASC
LIMIT 50;
```

### 5. Write a SQL query to find all teams that Satchel Paige played for.
**Your query should return a table with a single column, one for the name of the teams.**
```sql
SELECT DISTINCT "name" FROM "teams"
JOIN "performances" ON "performances"."team_id" = "teams"."id"
JOIN "players" ON "players"."id" = "performances"."player_id"
WHERE "first_name" = 'Satchel' AND "last_name" = 'Paige'
GROUP BY "name"
;
```

### 6. Write a SQL query to return the top 5 teams, sorted by the total number of hits by players in 2001.
**a.** Call the column representing total hits by players in 2001 “total hits”.  
**b.** Sort by total hits, highest to lowest.  
**c.** Your query should return two columns, one for the teams’ names and one for their total hits in 2001.  
```sql
SELECT "name", SUM("H") AS "total hits" FROM "performances"
JOIN "teams" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = 2001
GROUP BY "name"
ORDER BY "total hits" DESC
LIMIT 5
;
```

### 7. Write a SQL query to find the name of the player who’s been paid the highest salary, of all time, in Major League Baseball.
**Your query should return a table with two columns, one for the player’s first name and one for their last name.**
```sql
SELECT "first_name", "last_name" FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
ORDER BY "salary" DESC
LIMIT 1;
```

### 8. Write a SQL query to find the 2001 salary of the player who hit the most home runs in 2001.
**Your query should return a table with one column, the salary of the player.**
```sql
SELECT "salary" FROM "salaries"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
WHERE "salaries"."year" = 2001
ORDER BY "HR" DESC
LIMIT 1;
```

### 9. Write a SQL query to find the 5 lowest paying teams (by average salary) in 2001.
**a.** Round the average salary column to two decimal places and call it “average salary”.  
**b.** Sort the teams by average salary, least to greatest.  
**c.** Your query should return a table with two columns, one for the teams’ names and one for their average salary.  
```sql
SELECT "name", ROUND(AVG("salary"), 2) AS "average salary" FROM "teams"
JOIN "salaries" ON "salaries"."team_id" = "teams"."id"
WHERE "salaries"."year" = 2001
GROUP BY "team_id"
ORDER BY "average salary" ASC
LIMIT 5;
```

### 10. Write a query to return a table that includes
**a.** All player’s first names  
**b.** All player’s last names  
**c.** All player’s salaries  
**d.** All player’s home runs  
**e** The year in which the player was paid that salary and hit those home runs  
### Keep in mind
**a.** Order the results, first and foremost, by player’s IDs (least to greatest).  
**b.** Order rows about the same player by year, in descending order.  
**c.** Consider a corner case: suppose a player has multiple salaries or performances for a given year. Order them first by number of home runs, in descending order, followed by salary, in descending order.  
**d.** Be careful to ensure that, for a single row, the salary’s year and the performance’s year match.  
```sql
SELECT "first_name", "last_name", "salary", "HR", "performances"."year" FROM "performances"
JOIN "players" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
ORDER BY "players"."id" ASC, "performances"."year" DESC, "HR" DESC, "salary" DESC;
```

### 11. Write a SQL query to find the 10 least expensive players per hit in 2001.
**a.** Your query should return a table with three columns, one for the players’ first names, one of their last names, and one called “dollars per hit”.  
**b.** You can calculate the “dollars per hit” column by dividing a player’s 2001 salary by the number of hits they made in 2001. Recall you can use AS to rename a column.  
**c.** Dividing a salary by 0 hits will result in a NULL value. Avoid the issue by filtering out players with 0 hits.  
**d.** Sort the table by the “dollars per hit” column, least to most expensive. If two players have the same “dollars per hit”, order by first name, followed by last name, in alphabetical order.  
**e.** Ensure that the salary’s year and the performance’s year match.  
```sql
SELECT "first_name", "last_name", "salary"/"H" AS "dollars per hit" FROM "performances"
JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
JOIN "players" ON "players"."id" = "performances"."player_id"
WHERE "H" > 0 AND "performances"."year" = '2001'
ORDER BY "dollars per hit" ASC, "first_name" ASC, "last_name" ASC
LIMIT 10;
```

### 12. Write a SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.
**a.** Your query should return a table with two columns, one for the players’ first names and one of their last names.  
**b.** You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.  
**c.** You may assume, for simplicity, that a player will only have one salary and one performance in 2001.  
**d.** Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).  
```sql
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
```
