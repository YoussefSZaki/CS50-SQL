# CS50 SQL Problem Set 2: [ATL](https://cs50.harvard.edu/sql/2024/psets/2/atl/)

## Problem to Solve
Hartsfield-Jackson International Airport, perhaps better known as “ATL” for its IATA airport code, has been the busiest airport in the world since 1998. Located in Atlanta, Georgia in the United States, ATL served 93.7 million passengers in 2022. Maybe you were one of them!
Suppose you’ve just been hired to help ATL re-design their database system. Write a set of SQL statements to design a database with which Hartsfield-Jackson could keep track of its passengers and their flights.
## Complete Questions
Your task at hand is to create a SQLite database for ATL from scratch. The implementation details are up to you, though you should minimally ensure your database meets the airport’s requirements and that it can represent the given sample data.

## Requirments

### Passengers
**When it comes to our passengers, we just need to have the essentials in line: the first name, last name, and age. That’s all we need to know—nothing more.**  
```sql
CREATE TABLE "passengers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" NUMERIC,
    PRIMARY KEY("id")
);
```

### Check-Ins
**When passengers arrive at ATL, they’ll often “check in” to their flights. That’s them telling us they’re here and all set to board. We’d like to keep a tidy log of such moments. And what would we need to log, you ask? Well, here’s what we need:**  
**a.** The exact date and time at which our passenger checked in  
**b.** The flight they are checking in for, of course. Can’t lose track of where they’re headed, now can we?  
```sql
CREATE TABLE "check_ins"(
    "id" INTEGER,
    "passenger_id" INTEGER NOT NULL,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "airline_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("airline_id") REFERENCES "flights"("id")
);
```

### Airlines
**ATL’s a hub for many domestic and international airlines: names like Delta, British Airways, Air France, Korean Air, and Turkish Airlines. The list goes on. So here’s what we track:** 
**a.** The name of the airline  
**b.** The “concourse” or, shall I say, the section of our airport where the airline operates. We have 7 concourses: A, B, C, D, E, F, and T.  
```sql
CREATE TABLE "airlines"(
    "id" INTEGER,
    "name" TEXT UNIQUE NOT NULL,
    "concourse" TEXT CHECK("concourse" IN ('A','B','C','D','E','F')),
    PRIMARY KEY("id")
);
```

### Flights
**We serve as many as 1,000 flights daily. To ensure that our passengers are never left wondering, we need to give them all the critical details about their flight. Here’s what we’d like to store:**  
**a.** The flight number. For example, “900”. Just know that we sometimes re-use flight numbers.  
**b.** The airline operating the flight. You can keep it simple and assume one flight is operated by one airline.  
**c.** The code of the airport they’re departing from. For example, “ATL” or “BOS”.  
**d.** The code of the airport they’re heading to  
**e.** The expected departure date and time (to the minute, of course!)  
**f.** The expected arrival date and time, to the very same accuracy  
```sql
CREATE TABLE "flights"(
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "departure_code" TEXT NOT NULL,
    "arrival_code" TEXT NOT NULL,
    "departure_time" NUMERIC,
    "arrival_time" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
```













