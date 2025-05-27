# CS50 SQL Problem Set 0: [Cyberchase](https://cs50.harvard.edu/sql/2024/psets/0/cyberchase/)

## Problem to Solve

Welcome to Cyberspace! Cyberchase is an animated, educational kid’s television series, aired by the United States’ Public Broadcasting Service (PBS) since 2002. Originally designed to “show kids that math is everywhere and everyone can be good at it,” the world of Cyberchase centers on Jackie, Matt, and Inez as they team up with Digit—a “cybird”—to stop Hacker from taking over Cyberspace and infecting Motherboard. Along the way, the quartet learn math, science, and problem-solving skills to thwart Hacker in his attempts.

In a database called cyberchase.db, using a table called episodes, chase answers to PBS’s questions about Cyberchase’s episodes thus far.

## Complete Questions

### 1. Write a SQL query to list the titles of all episodes in Cyberchase’s original season, Season 1.
```sql
SELECT "title" FROM "episodes" WHERE season = 1;
```

### 2. List the season number of, and title of, the first episode of every season.
```sql
SELECT "season", "title" FROM "episodes" WHERE "episode_in_season" = 1;
```

### 3. Find the production code for the episode “Hackerized!”. 
```sql
SELECT "production_code" FROM "episodes" WHERE "title" = 'Hackerized!';
```

### 4. Write a query to find the titles of episodes that do not yet have a listed topic. 
```sql
SELECT "title" FROM "episodes" WHERE "topic" IS NULL;
```

### 5. Find the title of the holiday episode that aired on December 31st, 2004.
```sql
SELECT "title" FROM "episodes" WHERE "air_date" = '2004-12-31';
```

### 6. List the titles of episodes from season 6 (2008) that were released early, in 2007.
```sql
SELECT "title" FROM "episodes" WHERE ("air_date" LIKE '2007%' AND "season" = '6');
```

### 7. Write a SQL query to list the titles and topics of all episodes teaching fractions.
```sql
SELECT "title", "topic" FROM "episodes" WHERE "topic" LIKE '%fractions%';
```

### 8. Write a query that counts the number of episodes released in the last 6 years, from 2018 to 2023, inclusive.
```sql
SELECT COUNT("title") FROM "episodes" WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';
```

### 9. Write a query that counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.
```sql
SELECT COUNT("title") FROM "episodes" WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';
```

### 10. Write a SQL query to list the ids, titles, and production codes of all episodes. Order the results by production code, from earliest to latest.
```sql
SELECT "id", "title", "production_code" FROM "episodes" ORDER BY "production_code" ASC;
```

### 11. List the titles of episodes from season 5, in reverse alphabetical order.
```sql
SELECT "title" FROM "episodes" WHERE "season" = '5' ORDER BY "title" DESC;
```

### 12. Count the number of unique episode titles.
```sql
SELECT COUNT(DISTINCT "title") FROM "episodes";
```

### 13. write a SQL query to explore a question of your choice. This query should:
### > Involve at least one condition, using WHERE with AND or OR
```sql
SELECT "title" FROM "episodes" WHERE ("air_date" LIKE '2019%' OR "air_date" LIKE '2020%');
```











