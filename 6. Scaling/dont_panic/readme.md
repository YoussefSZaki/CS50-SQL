# CS50 SQL Problem Set 6: [Don’t Panic!](https://cs50.harvard.edu/sql/2024/psets/6/dont-panic/python/)

## Problem to Solve
You're a trained "pentester." After your success in an earlier operation, a new company has hired you to perform a penetration test and report the vulnerabilities in their data system. This time, you suspect you can do better by writing a program in Python that automates your hack.
To succeed in this covert operation, you'll need to:

1. **Connect** to a SQLite database via Python
2. **Alter** the administrator's password within your Python program

## Complete Question
### Specification
In hack.py, write a Python program to achieve the following:

Connect, via Python, to a SQLite database.
Alter, within your Python program, the administrator's password.
When your program in hack.py is run on a new instance of the database, it should produce the above results.

Clock's ticking!

```python
from cs50 import SQL

db = SQL("sqlite:///dont-panic.db")
password = input("Enter a password: ")
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    password
)
```
