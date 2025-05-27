# CS50 SQL Problem Set 5: [In a Snap](https://cs50.harvard.edu/sql/2024/psets/5/snap/)

## Problem to Solve
After the printing press, the postal service, and the telegram came the messaging apps. Chances are you’ve used a messaging app today—whether Facebook Messenger, iMessage, Instagram, Signal or Snapchat, among many others. Whereas their early counterparts measured speed of communication in terms of weeks, days, or hours, messaging apps depend on a kind of speed that’s on the order of milliseconds: a message delayed is now a connection missed.

In this problem, you’ll write SQL queries for a fictional app that allows users to send pictures which expire 30 seconds after the recipient views them (an idea popularized by Snapchat!). The queries you’ll write will ultimately enable the app to implement its core features. Yet, given the app has several thousand users depending on instant communication, it’s especially important to write queries that are fast, not only correct. You’ll practice writing queries that take advantage of indexes, all in the service of letting users stay in touch in a snap.

## Complete Questions
## Specification

Write a SQL query to implement the features described below. Since speed is of the essence, you'll need to also ensure your query uses the specified index.

### 1

The app's user engagement team needs to identify active users. Find all usernames of users who have logged in since 2024-01-01. 
```sql
SELECT "username" FROM "users"
WHERE "last_login_date" > '2024-01-01';
```

### 2

Users need to be prevented from re-opening a message that has expired. Find when the message with ID 151 expires. You may use the message's ID directly in your query.
```sql
SELECT "expires_timestamp" FROM "messages"
WHERE "id" = 151;
```

### 3

The app needs to rank a user's "best friends," similar to Snapchat's "Friend Emojis" feature. Find the user IDs of the top 3 users to whom `creativewisdom377` sends messages most frequently. Order the user IDs by the number of messages `creativewisdom377` has sent to those users, most to least.

```sql
SELECT "to_user_id" FROM "messages"
WHERE "from_user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'creativewisdom377'
)
GROUP BY "to_user_id"
ORDER BY COUNT("id") DESC
LIMIT 3;
```
## 4

The app needs to send users a summary of their engagement. Find the username of the most popular user, defined as the user who has had the most messages sent to them.
```sql
SELECT "username" FROM "users"
WHERE "id" = (
    SELECT "to_user_id" FROM "messages"
    GROUP BY "to_user_id"
    ORDER BY COUNT("id") DESC
    LIMIT 1
);
```

## 5.sql

For any two users, the app needs to quickly show a list of the friends they have in common. Given two usernames, `lovelytrust487` and `exceptionalinspiration482`, find the user IDs of their mutual friends. A mutual friend is a user that both `lovelytrust487` and `exceptionalinspiration482` count among their friends.
```sql
SELECT "user_id" FROM "friends"
WHERE "friend_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'lovelytrust487'
)
INTERSECT
SELECT "user_id" FROM "friends"
WHERE "friend_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'exceptionalinspiration482'
);
```
