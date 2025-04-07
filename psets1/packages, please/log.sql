-- *** The Lost Letter ***
--To find the id of the from address
SELECT * FROM "addresses" WHERE "address" = '900 Somerville Avenue';
--To find all the packages sent from the sender address
SELECT *  FROM "packages" WHERE "from_address_id" = '432';
--To find the status of the package in question using the package id
SELECT * FROM "scans" WHERE "package_id" = '384';
--To find the information on the address that received the package
SELECT * FROM "addresses" WHERE "id" = '854';
-- *** The Devious Delivery ***
--Since the customer said there is no from address, this was to find any packages without a from address and get all information associated with it
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;
--To search for scans of package using the package id
SELECT * FROM "scans" WHERE "package_id" = 5098;
--To get all information about the address the package was dropped off at
SELECT * FROM "addresses" WHERE "id" = 384;
-- *** The Forgotten Gift ***
--First to find the sender address id
SELECT * FROM "addresses" WHERE "address" = '109 Tileston Street';
--Then to find any packages sent from this address using the address id
SELECT * FROM "packages" WHERE "from_address_id" = 9873;
--Then we search for the status of the package using the package id
SELECT * FROM "scans" WHERE "package_id" = 9532;

