# CS50 SQL Problem Set 2: [Happy to Connect](https://cs50.harvard.edu/sql/2024/psets/2/connect/)

## Problem to Solve
LinkedIn is “the world’s largest professional network” with a mission to “connect the world’s professionals to make them more productive and successful.” Perhaps you have an account? On the platform, users can post their professional experience (i.e., past jobs, education, etc.) and make connections with other people they’ve met, in-person or online.
Write a set of SQL statements to design a database LinkedIn could use.

## Complete Questions
Your task at hand is to create a SQLite database for LinkedIn from scratch. The implementation details are up to you, though you should minimally ensure that your database meets the platform’s specification and that it can represent the given sample data.

## Specifications

### Users
**The heart of LinkedIn’s platform is its people. Your database should be able to represent the following information about LinkedIn’s users:**  
**a.** Their first and last name  
**b.** Their username  
**c.** Their password  
```sql
CREATE TABLE "users"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);
```

### Schools and Universities
**LinkedIn also allows for official school or university accounts, such as that for Harvard, so alumni (i.e., those who’ve attended) can identify their affiliation. Ensure that LinkedIn’s database can store the following information about each school:**  
**a.** The name of the school  
**b.** The type of school (e.g., “Elementary School”, “Middle School”, “High School”, “Lower School”, “Upper School”, “College”, “University”, etc.)  
**c.** The school’s location  
**d.** The year in which the school was founded  
```sql
CREATE TABLE "schools"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER,
    PRIMARY KEY("id")
);
```

### Companies
**LinkedIn allows companies to create their own pages, like the one for LinkedIn itself, so employees can identify their past or current employment with the company. Ensure that LinkedIn’s database can store the following information for each company:**  
**a.** The name of the company  
**b.** The company’s industry (e.g., “Education”, “Technology, “Finance”, etc.)  
**c.** The company’s location  
```sql
CREATE TABLE "companies"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);
```

### Connections
**And finally, the essence of LinkedIn is its ability to facilitate connections between people. Ensure LinkedIn’s database can support each of the following connections.**  

**A. Connections with People**  
LinkedIn’s database should be able to represent mutual (reciprocal, two-way) connections between users. No need to worry about one-way connections, such as user A “following” user B without user B “following” user A.
```sql
CREATE TABLE "people_connections"(
    "user1" INTEGER,
    "user2" INTEGER,
    PRIMARY KEY("user1", "user2")
);
```
**B. Connections with Schools**  
A user should be able to create an affiliation with a given school. And similarly, that school should be able to find its alumni. Additionally, allow a user to define:  
**a.** The start date of their affiliation (i.e., when they started to attend the school)  
**b.** The end date of their affiliation (i.e., when they graduated), if applicable  
**c.** The type of degree earned/pursued (e.g., “BA”, “MA”, “PhD”, etc.)  
```sql
CREATE TABLE "school_connections"(
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "degree" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);
```

**C. Connections with Companies**  
A user should be able to create an affiliation with a given company. And similarly, a company should be able to find its current and past employees. Additionally, allow a user to define:  
**a.** The start date of their affiliation (i.e., the date they began work with the company)  
**b.** The end date of their affiliation (i.e., when left the company), if applicable  
**c** The title they held while affiliated with the company  
```sql
CREATE TABLE "company_connections"(
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "title" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
```










