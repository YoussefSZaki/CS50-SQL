# CS50 SQL Problem Set 1: [Packages, Please](https://cs50.harvard.edu/sql/2024/psets/1/packages/)

## Problem to Solve
You are a mail clerk for the city of Boston and, as such, you oversee the delivery of mail across the city. For the most part, all packages sent are eventually delivered. Except, every once in while, a mystery falls into your lap: a missing package! For each customer that comes to you with a report of a missing package, your job is to determine:  
**The current address (or location!) of their missing package**  
**The type of address or location (e.g. residential, business, etc.)**  
**The contents of the package**  

All you know is what the customers themselves will tell you. To solve each mystery, you’ll need to use the mail delivery service’s database, packages.db, which contains data on the transit of packages around the city. Using just the information in the database, your task is to help each customer find their missing package.

## Complete Questions

### The Lost Letter: 
**Your first report of a missing package comes from Anneke. Anneke walks up to your counter and tells you the following:
Clerk, my name’s Anneke. I live over at 900 Somerville Avenue. Not long ago, I sent out a special letter. It’s meant for my friend Varsha. She’s starting a new chapter of her life at 2 Finnegan Street, uptown. (That address, let me tell you: it was a bit tricky to get right the first time.) The letter is a congratulatory note—a cheery little paper hug from me to her, to celebrate this big move of hers. Can you check if it’s made its way to her yet?**
```sql
--To find the id of the from address
SELECT * FROM "addresses" WHERE "address" = '900 Somerville Avenue';
--To find all the packages sent from the sender address
SELECT *  FROM "packages" WHERE "from_address_id" = '432';
--To find the status of the package in question using the package id
SELECT * FROM "scans" WHERE "package_id" = '384';
--To find the information on the address that received the package
SELECT * FROM "addresses" WHERE "id" = '854';
```
**a.At what type of address did the Lost Letter end up?:** Residential  
**b.At what address did the Lost Letter end up?:** 2 Finnigan Street  

### The Devious Delivery:
**Your second report of a missing package comes from a mysterious fellow from out of town. They walk up to your counter and tell you the following:
Good day to you, deliverer of the mail. You might remember that not too long ago I made my way over from the town of Fiftyville. I gave a certain box into your reliable hands and asked you to keep things low. My associate has been expecting the package for a while now. And yet, it appears to have grown wings and flown away. Ha! Any chance you could help clarify this mystery? Afraid there’s no “From” address. It’s the kind of parcel that would add a bit more… quack to someone’s bath times, if you catch my drift.**  
```sql
--Since the customer said there is no from address, this was to find any packages without a from address and get all information associated with it
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;
--To search for scans of package using the package id
SELECT * FROM "scans" WHERE "package_id" = 5098;
--To get all information about the address the package was dropped off at
SELECT * FROM "addresses" WHERE "id" = 384;
```
**a.At what type of address did the Devious Delivery end up?:** Police Station  
**b.What were the contents of the Devious Delivery?:** Duck debugger  

### The Forgotten Gift:
**Your third report of a missing package comes from a grandparent who lives down the street from the post office. They approach your counter and tell you the following:
Oh, excuse me, Clerk. I had sent a mystery gift, you see, to my wonderful granddaughter, off at 728 Maple Place. That was about two weeks ago. Now the delivery date has passed by seven whole days and I hear she still waits, her hands empty and heart filled with anticipation. I’m a bit worried wondering where my package has gone. I cannot for the life of me remember what’s inside, but I do know it’s filled to the brim with my love for her. Can we possibly track it down so it can fill her day with joy? I did send it from my home at 109 Tileston Street.**  
```sql
--First to find the sender address id
SELECT * FROM "addresses" WHERE "address" = '109 Tileston Street';
--Then to find any packages sent from this address using the address id
SELECT * FROM "packages" WHERE "from_address_id" = 9873;
--Then we search for the status of the package using the package id
SELECT * FROM "scans" WHERE "package_id" = 9532;
```
**a.What are the contents of the Forgotten Gift?:** Flowers  
**b.Who has the Forgotten Gift?:** Mikel  





