# CS50 SQL Problem Set 4: [The Private Eye](https://cs50.harvard.edu/sql/2024/psets/4/private/)

## Problem to Solve
CS50's duck debugger has disappeared once more and you desperately need a detective. You've heard stories of one who lives uptown, always secretive in their work, never seen but when they want to be. Unsurprisingly, they've proven to be quite elusive to you. But here you are, in their study, after picking up their address from a certain mail clerk.

On their mahogany desk, fresh white paper glints. Inscribed is the following table:

|  |   |   |
|------|------|------|
| 14   | 98   | 4    |
| 114  | 3    | 5    |
| 618  | 72   | 9    |
| 630  | 7    | 3    |
| 932  | 12   | 5    |
| 2230 | 50   | 7    |
| 2346 | 44   | 10   |
| 3041 | 14   | 5    |

And tucked underneath, a worn book, *The Adventures of Sherlock Holmes*.


## Complete Question
**Background**

Given the paper's proximity to *The Adventures of Sherlock Holmes*, what's written on it seems to be some variation of a book cipher. You know that in one version of a book cipher, the cipher's creator gives you a list of "triplets" (i.e., a set of three numbers). Each triplet is structured as follows:

- The first number in the triplet is the **sentence number** referenced by the encoder.
- The second number in the triplet is the **character number**, within that sentence, at which the message begins.
- The third number in the triplet is the **message length** in characters (i.e., how many characters to read from the first, including spaces and punctuation).

For instance, consider the triplet `2, 1, 8` in light of the following sentences:

1. Quite so!
2. You have not observed.
3. And yet you have seen.

`2` refers to the 2nd sentence, "You have not observed." `1` refers to the 1st character in that sentence, "Y." And `8` refers to the length of the message from that first character. Starting from the 1st character of the 2nd sentence, reading 8 characters (including spaces!) gives you:

```
You have
```

You can imagine, now, stringing together multiple tuples to encode a longer message. Perhaps that's exactly what the detective has done!

### Specification

Your task at hand is to decode the cipher left for you by the detective. How you do so is up to you, but you should ensure that—at the end of your process—you have a view structured as follows:

- The view should be named `message`
- The view should have a single column, `phrase`
- When the following SQL query is executed on `private.db`, your view should return a single column in which each row is one phrase in the message.

```sql
SELECT "phrase" FROM "message";
```

Write all SQL statements required to replicate your creation of the view.
```sql
CREATE TABLE "code"(
    "x" INTEGER,
    "y" INTEGER,
    "z" INTEGER
);

INSERT INTO "code"("x", "y", "z")
VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5);

CREATE VIEW "phrases" AS
SELECT "x", "y", "z", "sentence" FROM "sentences"
JOIN "code" ON "code"."x" = "sentences"."id";

CREATE VIEW "message" AS
SELECT substr("sentence", "y", "z") AS "phrase" FROM "phrases";
```
