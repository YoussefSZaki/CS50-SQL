# CS50 SQL Problem Set 6: [Happy to Connect](https://cs50.harvard.edu/sql/2024/psets/6/connect/)

## Problem to Solve
You might recall from an earlier problem that LinkedIn is “the world’s largest professional network” with a mission to “connect the world’s professionals to make them more productive and successful.” Odds are, then, they use full-fledged database servers to ensure their platform is highly available around the world.

Write a set of SQL statements to design a MySQL database schema that LinkedIn could use.

## Complete Question
## Specification
Your task at hand is to create a MySQL database for LinkedIn from scratch. The implementation details are up to you, though you should minimally ensure that your database meets the platform’s specification and that it can represent the given sample data. You’re welcome to use, or improve upon, your design of a SQLite database—just keep in mind that you’ll now have a new set of types at your disposal!

## Requirements

### Users
The heart of LinkedIn's platform is its people. Your database should be able to represent the following information about LinkedIn's users:

- Their first and last name
- Their username
- Their password

*Note:* If a company is following best practices, application passwords are "hashed." No need to worry about hashing passwords here, though it might be helpful to know that some hashing algorithms can produce strings up to 128 characters long.
```sql
CREATE TABLE `users`(
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `username` VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);
```

### Schools and Universities
LinkedIn allows for official school or university accounts so alumni can identify their affiliation. Store the following information about each school:

- The name of the school
- The type of school ("Primary", "Secondary", or "Higher Education")
- The school's location
- The year in which the school was founded

*Constraint:* Schools must choose one of three types: "Primary," "Secondary," or "Higher Education."
```sql
CREATE TABLE `schools`(
    `id` INT,
    `name` VARCHAR(30) NOT NULL,
    `type` ENUM('Primary','Secondary','Higher Education') NOT NULL,
    `location` VARCHAR(30) NOT NULL,
    `year` MEDIUMINT,
    PRIMARY KEY(`id`)
);
```

### Companies
LinkedIn allows companies to create their own pages so employees can identify their past or current employment. Store the following for each company:

- The name of the company
- The company's industry ("Technology", "Education", or "Business")
- The company's location

*Constraint:* Companies must choose from one of three industries: "Technology," "Education," or "Business."
```sql
CREATE TABLE `companies`(
    `id` INT,
    `name` VARCHAR(30) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(30) NOT NULL,
    PRIMARY KEY(`id`)
);
```

## Connection Requirements

### Connections with People
Represent mutual (reciprocal, two-way) connections between users.  
*Note:* No need to implement one-way "following" relationships.
```sql
CREATE TABLE `people_connections`(
    `user1` VARCHAR(30),
    `user2` VARCHAR(30),
    PRIMARY KEY(`user1`, `user2`)
);
```

### Connections with Schools
Support user-school affiliations with:

- Start date of affiliation (when they started attending)
- End date of affiliation (when they graduated), if applicable
- Type of degree earned/pursued (e.g., "BA", "MA", "PhD", etc.)

*Functionality:*
- Users can create school affiliations
- Schools can find their alumni
```sql
CREATE TABLE `school_connections`(
    `user_id` INT,
    `school_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree` VARCHAR(30) NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);
```

### Connections with Companies
Support user-company employment relationships with:

- Start date of affiliation (employment start date)
- End date of affiliation (when left the company), if applicable

*Functionality:*
- Users can create company affiliations
- Companies can find current/past employees
```sql
CREATE TABLE `company_connections`(
    `user_id` INT,
    `company_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `title` VARCHAR(30) NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
```
