-- new things? (ALTER TABLE (ADD COLUMNS)), changing things? (UPDATE table_name), 
-- wanna delete? (DELETE FROM () {WHERE (Make sure it's in or else whole table will collapse)})
-- wanna join ? (table1 (INNER, LEFT, RIGHT) JOIN table2)
-- wanna concatanate? SELECT CONCAT(first_name, " ", last_name) AS full_name FROM table1;
-- SET SQL_SAFE_UPDATES = 0;

-- INDEX (Btree data structure)
-- Indexes are used to find the values within a specific column more quickly
-- MySQL normally searches sequentially through a column
-- The longer the column, the more expensive the operation is
-- 'UPDATE' (updating the values of index) takes more time, SELECT takes less time

USE mydb;

SELECT * FROM customers;

SHOW INDEXES FROM customers;

CREATE INDEX last_name_idx
ON customers(last_name); -- last_name became a index now. The value can be seen more quickly here.

SHOW INDEXES FROM customers;

SELECT * FROM customers
WHERE last_name = "Neves"; -- now this value can be selected way more faster. The difference of speed can be seen in a large database set

SELECT * FROM customers
WHERE first_name = "Ruben"; -- it will show up slowly cuz, 'first_name' donot have any indexes yet.

-- CREATE A MULTI COLUMN INDEX

CREATE INDEX last_name_first_name_idx
ON customers(last_name, first_name);

SHOW INDEXES FROM customers;

-- DROP a index
ALTER TABLE customers
DROP INDEX last_name_idx;

SHOW INDEXES FROM customers;

SELECT * FROM customers -- in last_name_first_name_idx the last_name was assigned first & then the first name to the index. So, last_name should be declared first
WHERE last_name = "Rice" AND first_name = "Declan";
