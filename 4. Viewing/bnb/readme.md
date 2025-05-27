# CS50 SQL Problem Set 4: [Bed and Breakfast](https://cs50.harvard.edu/sql/2024/psets/4/bnb/)

## Problem to Solve
A Bed and Breakfast (“BnB” for short!) is a short-term place one might stay and pay the owner for the service, similar to a hotel. Over the past few years, AirBnB has allowed most anyone to rent out their place, whether it’s a home, a cute cottage, or even a treehouse.

You’re a data analyst for the City of Boston and you’re interested in discovering how the rise of AirBnB has changed the local tourist scene. Whip up a few views that will paint a clearer picture of AirBnB’s influence on the city of Boston.

## Complete Question
## Specification

**Write a SQL statement to create each of the following views of the data in `bnb.db`. Note that, while views can be created from other views, each of your views should stand alone (i.e., not rely on a prior view).**  

### No Descriptions

Write a SQL statement to create a view named `no_descriptions` that includes all of the columns in the `listings` table except for `description`.
```sql
CREATE VIEW "no_descriptions" AS
SELECT "id", "property_type", "host_name", "accommodates", "bedrooms" FROM "listings";
```

### One-Bedrooms

Write a SQL statement to create a view named `one_bedrooms`. This view should contain all listings that have exactly one bedroom. Ensure the view contains the following columns:

- `id`, which is the id of the listing from the `listings` table.
- `property_type`, from the `listings` table.
- `host_name`, from the `listings` table.
- `accommodates`, from the `listings` table.
```sql
CREATE VIEW "one_bedrooms" AS
SELECT "id", "property_type", "host_name", "accommodates" FROM "listings"
WHERE "bedrooms" = 1;
```

### Available

Write a SQL statement to create a view named `available`. This view should contain all dates that are available at all listings. Ensure the view contains the following columns:

- `id`, which is the id of the listing from the `listings` table.
- `property_type`, from the `listings` table.
- `host_name`, from the `listings` table.
- `date`, from the `availabilities` table, which is the date of the availability.
```sql
CREATE VIEW "available" AS
SELECT "availabilities"."id", "property_type", "host_name", "date" FROM "listings"
JOIN "availabilities" ON "availabilities"."listing_id" = "listings"."id"
WHERE "available" = "TRUE";
```

### Frequently Reviewed

Write a SQL statement to create a view named `frequently_reviewed`. This view should contain the 100 most frequently reviewed listings, sorted from most- to least-frequently reviewed. Ensure the view contains the following columns:

- `id`, which is the id of the listing from the `listings` table.
- `property_type`, from the `listings` table.
- `host_name`, from the `listings` table.
- `reviews`, which is the number of reviews the listing has received.

If any two listings have the same number of reviews, sort by `property_type` (in alphabetical order), followed by `host_name` (in alphabetical order).
```sql
CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("reviews"."listing_id") AS "reviews" FROM "listings"
JOIN "reviews" ON "reviews"."listing_id" = "listings"."id"
GROUP BY "listings"."id"
ORDER BY "reviews" DESC, "property_type" ASC, "host_name" ASC
LIMIT 100;
```

### June Vacancies

Write a SQL statement to create a view named `june_vacancies`. This view should contain all listings and the number of days in June of 2023 that they remained vacant. Ensure the view contains the following columns:

- `id`, which is the id of the listing from the `listings` table.
- `property_type`, from the `listings` table.
- `host_name`, from the `listings` table.
- `days_vacant`, which is the number of days in June of 2023, that the given listing was marked as available.
```sql
CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("availabilities"."listing_id") AS "days_vacant" FROM "listings"
JOIN "availabilities" ON "availabilities"."listing_id" = "listings"."id"
WHERE "date" LIKE "2023-06-%" AND "available" = "TRUE"
GROUP BY "listings"."id";
```
