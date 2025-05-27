# CS50 SQL Problem Set 3: [Don’t Panic!](https://cs50.harvard.edu/sql/2024/psets/3/dont-panic/)

## Problem to Solve
You’re a trained “pentester.” Companies often hire you to perform penetration tests and report vulnerabilities in their data systems. Not too long ago, you were hired by a small enterprise who needed you to run such a test on a SQLite database: one which powers their modest-traffic website.

To succeed in this covert operation, you’ll need to…  
**a.** Alter the password of the website’s administrative account.  
**b.** Erase any logs of the above password change recorded by the database.  
**c.** Add false data to throw the company off of your trail.  

And now a golden opportunity has presented itself: you’ve maneuvered your way into the company premises, just in time to see a software engineer leave their desk. The engineer’s connection to the database is still open. You estimate you have 5 minutes before they come back. Ready?

## Complete Question

### Write a sequence of SQL statements to achieve the following:

**a.** Alter the password of the website’s administrative account, admin, to instead be “oops!”.  
**b.** Erase any logs of the above password change recorded by the database.  
**c.** Add false data to throw others off your trail. In particular, to frame emily33, make it only appear—in the user_logs table—as if the admin account has had its password changed to emily33’s password.  

**Keep in mind that passwords are usually not stored “in the clear”—that is, as the plain characters that make up the password. Instead they’re “hashed,” or scrambled, to preserve privacy. Given this reality, you’ll need to ensure the password to which you change the administrative password is also hashed. Thankfully, you know that the passwords in the users table are already stored as MD5 hashes.**  
```sql
INSERT INTO "user_logs"("type","old_username","new_username","old_password","new_password")
VALUES
('update','admin','admin','e10adc3949ba59abbe56e057f20f883e','44bf025d27eea66336e5c1133c3827f7');

UPDATE "users" SET "password" = '982c0381c279d139fd221fce974916e7' WHERE "username" = 'admin';

DELETE FROM "user_logs" WHERE "new_password" = '982c0381c279d139fd221fce974916e7';
```
