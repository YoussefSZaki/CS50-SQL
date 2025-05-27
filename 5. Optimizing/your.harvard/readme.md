# CS50 SQL Problem Set 5: [your.harvard](https://cs50.harvard.edu/sql/2024/psets/5/your.harvard/)

## Problem to Solve
If you’re not already familiar, Harvard has a course shopping tool called my.harvard, with which students explore (and ultimately register for!) classes. To keep track of courses, students, and their registrations, my.harvard presumably uses some kind of underlying database. And yet, if you’ve ever used it, you’ll know that my.harvard isn’t especially… quick.

Here’s your chance to make my.harvard just a little bit faster! In this problem, take some Harvard course data and create indexes to speed up typical queries on the database. Keep in mind that indexing every column isn’t always the best solution: you’ll need to consider trade-offs in terms of space and time, ultimately representing Harvard’s courses and students in the most efficient way possible.

## Complete Question
## Specification

In `indexes.sql`, write a set of SQL statements that create indexes which will speed up typical queries on the `harvard.db` database. The number of indexes you create, as well as the columns they include, is entirely up to you. Be sure to balance speed with disk space, only creating indexes you need.

When engineers optimize a database, they often care about the typical queries run on the database. Such queries highlight patterns with which a database is accessed, thus revealing the best columns and tables on which to create indexes. Below are the typical SELECT queries run on `harvard.db`:

### Typical SELECT queries on harvard.db

1. Find a student's historical course enrollments, based on their ID:

```sql
SELECT "courses"."title", "courses"."semester"
FROM "enrollments"
JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
JOIN "students" ON "enrollments"."student_id" = "students"."id"
WHERE "students"."id" = 3;
```

2. Find all students who enrolled in Computer Science 50 in Fall 2023:

```sql
SELECT "id", "name"
FROM "students"
WHERE "id" IN (
    SELECT "student_id"
    FROM "enrollments"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "courses"."department" = 'Computer Science'
        AND "courses"."number" = 50
        AND "courses"."semester" = 'Fall 2023'
    )
);
```

3. Sort courses by most- to least-enrolled in Fall 2023:

```sql
SELECT "courses"."id", "courses"."department", "courses"."number", "courses"."title", COUNT(*) AS "enrollment"
FROM "courses"
JOIN "enrollments" ON "enrollments"."course_id" = "courses"."id"
WHERE "courses"."semester" = 'Fall 2023'
GROUP BY "courses"."id"
ORDER BY "enrollment" DESC;
```

4. Find all computer science courses taught in Spring 2024:

```sql
SELECT "courses"."id", "courses"."department", "courses"."number", "courses"."title"
FROM "courses"
WHERE "courses"."department" = 'Computer Science'
AND "courses"."semester" = 'Spring 2024';
```

5. Find the requirement satisfied by "Advanced Databases" in Fall 2023:

```sql
SELECT "requirements"."name"
FROM "requirements"
WHERE "requirements"."id" = (
    SELECT "requirement_id"
    FROM "satisfies"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "title" = 'Advanced Databases'
        AND "semester" = 'Fall 2023'
    )
);
```

6. Find how many courses in each requirement a student has satisfied:

```sql
SELECT "requirements"."name", COUNT(*) AS "courses"
FROM "requirements"
JOIN "satisfies" ON "requirements"."id" = "satisfies"."requirement_id"
WHERE "satisfies"."course_id" IN (
    SELECT "course_id"
    FROM "enrollments"
    WHERE "enrollments"."student_id" = 8
)
GROUP BY "requirements"."name";
```

7. Search for a course by title and semester:

```sql
SELECT "department", "number", "title"
FROM "courses"
WHERE "title" LIKE "History%"
AND "semester" = 'Fall 2023';
```

### Answers:
1. **Student Enrollments Index**  
   ```sql
   CREATE INDEX "student_enrollments_index" ON "enrollments"("student_id");
   ```

2. **Course Enrollments Index**  
   ```sql
   CREATE INDEX "course_enrollments_index" ON "enrollments"("course_id");
   ```

3. **Course Semester Index**  
   ```sql
   CREATE INDEX "course_semester_index" ON "courses"("semester");
   ```

4. **Course Requirements Index**  
   ```sql
   CREATE INDEX "satisfies_course_index" ON "satisfies"("course_id");
   ```
