# CS50 SQL Problem Set 3: [Meteorite Cleaning](https://cs50.harvard.edu/sql/2024/psets/3/meteorites/)

## Problem to Solve
As a data engineer at NASA, you often spend your time cleaning meteorites—or at least the data they create.

You’ve been given a CSV file of historical meteorite landings here on Earth, of which there are quite a few! Your job is to import the data into a SQLite database, cleaning it up along the way. After you’re done, the database will be used in analyses by some of your fellow engineers.

## Complete Questions
Write a series of SQL (and SQLite) statements to import and clean the data from `meteorites.csv` into a table, `meteorites`, in a database called `meteorites.db`.

The `meteorites` table should have the following columns:

**Columns in the meteorites table**
- `id`, which represents the unique ID of the meteorite.
- `name`, which represents the given name of the meteorite.
- `class`, which is the classification of the meteorite, according to the traditional classification scheme.
- `mass`, which is the weight of the meteorite, in grams.
- `discovery`, which is either "Fell" or "Found". "Fell" indicates the meteorite was seen falling to Earth, whereas "Found" indicates the meteorite was found only after landing on Earth.
- `year`, which is the year in which the the meteorite was discovered.
- `lat`, which is the latitude at which the meteorite landed.
- `long`, which is the longitude at which the meteorite landed.

Keep in mind that not all columns in the CSV should end up in the final table!

To consider the data in the `meteorites` table clean, you should ensure...

1. Any empty values in `meteorites.csv` are represented by `NULL` in the `meteorites` table.
   - Keep in mind that the `mass`, `year`, `lat`, and `long` columns have empty values in the CSV.
2. All columns with decimal values (e.g., `70.4777`) should be rounded to the nearest hundredths place (e.g., `70.4777` becomes `70.48`).
   - Keep in mind that the `mass`, `lat`, and `long` columns have decimal values.
3. All meteorites with the `nametype` "Relict" are not included in the `meteorites` table.
4. The meteorites are sorted by `year`, oldest to newest, and then—if any two meteorites landed in the same year—by `name`, in alphabetical order.
5. You've updated the IDs of the meteorites from `meteorites.csv`, according to the order specified in #4.
   - The `id` of the meteorites should start at 1, beginning with the meteorite that landed in the oldest year and is the first in alphabetical order for that year.

```sql
.import --csv meteorites.csv temp
UPDATE "temp" SET "year" = NULL WHERE "year" = '';
UPDATE "temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "temp" SET "lat" = NULL WHERE "lat" = '';
UPDATE "temp" SET "long" = NULL WHERE "long" = '';
UPDATE "temp" SET "mass" = ROUND("mass", 2);
UPDATE "temp" SET "lat" = ROUND("lat", 2);
UPDATE "temp" SET "long" = ROUND("long", 2);
DELETE FROM "temp" WHERE "nametype" = 'Relict';

CREATE TABLE "meteorites"(
    "id" INTEGER UNIQUE,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "temp"
ORDER BY "year" ASC, "name" ASC;

DROP TABLE "temp";
```
