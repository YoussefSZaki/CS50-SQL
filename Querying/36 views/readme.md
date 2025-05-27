# CS50 SQL Problem Set 0: Views

## Complete Questions

### 1. Write a SQL query that a translator might take interest in: list, side by side, the Japanese title and the English title for each print. Ensure the Japanese title is the first column, followed by the English title.
```sql
SELECT "japanese_title", "english_title" FROM "views";
```

### 2. Write a SQL query to list the average colors of prints by Hokusai that include “river” in the English title.
```sql
SELECT "average_color" FROM "views"
WHERE "english_title" LIKE "%river%"
AND "artist" = 'Hokusai';
```

### 3. Write a SQL query to count how many prints by Hokusai include “Fuji” in the English title. 
```sql
SELECT COUNT("english_title") AS "count" FROM "views"
WHERE "english_title" LIKE "%Fuji%"
AND "artist" = "Hokusai";
```

### 4. Write a SQL query to count how many prints by Hiroshige have English titles that refer to the “Eastern Capital”. 
```sql
SELECT COUNT("english_title") AS "count" FROM "views"
WHERE "english_title" LIKE "%Eastern Capital%"
AND "artist" = "Hiroshige";
```

### 5. Write a SQL query to find the highest contrast value of prints by Hokusai. Name the column “Maximum Contrast”.
```sql
SELECT "contrast" AS "Maximum Contrast" FROM "views"
WHERE "artist" = 'Hokusai'
ORDER BY "Maximum Contrast" DESC LIMIT 1;
```

### 6. Write a SQL query to find the average entropy of prints by Hiroshige, rounded to two decimal places. Call the resulting column “Hiroshige Average Entropy”.
```sql
SELECT ROUND(AVG("entropy"), 2) AS "Hiroshige Average Entropy" FROM "views"
WHERE "artist" = 'Hiroshige';
```

### 7. Write a SQL query to list the English titles of the 5 brightest prints by Hiroshige, from most to least bright.
```sql
SELECT "english_title" FROM "views" WHERE "artist" = 'Hiroshige'
ORDER BY "brightness" DESC LIMIT 5;
```

### 8. Write a SQL query to list the English titles of the 5 prints with the least contrast by Hokusai, from least to highest contrast.
```sql
SELECT "english_title" FROM "views" WHERE "artist" = 'Hokusai'
ORDER BY "contrast" ASC LIMIT 5;
```

### 9. Write a SQL query to find the English title and artist of the print with the highest brightness.
```sql
SELECT "english_title", "artist" FROM "views"
ORDER BY "brightness" DESC LIMIT 1;
```

### 10. Write a SQL query to answer a question of your choice about the prints. The query should:
**a.** Make use of AS to rename a column  
**b.** Involve at least one condition, using WHERE   
**c.** Sort by at least one column, using ORDER BY   
```sql
SELECT "english_title", "brightness" AS "Hokusai Highest to lowest brightness"
FROM "views" WHERE "artist" = 'Hokusai'
ORDER BY "brightness" DESC;
```
