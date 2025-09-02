USE mydb;

SELECT * FROM transactions;

SELECT COUNT(amount) AS count -- it names the column header as count
FROM transactions; -- returns 5. Means we've 5 transactions in the table
-- 'WHERE transaction_date = someting' it can be added as well

SELECT COUNT(amount) AS "today's transaction"
FROM transactions;

-- checking maximum VALUES
SELECT MAX(amount) AS MAX_AMOUNT
FROM transactions;

-- minimum
SELECT MIN(amount) AS MIN_AMOUNT
FROM transactions;

-- average
SELECT AVG(amount) AS AVG_OF_AMOUNT
FROM transactions;

-- sum
SELECT SUM(amount) AS SUM_OF_AMOUNT
FROM transactions;

-- using concatanation
-- first_name + last_name = full_name
SELECT * FROM employees;

SELECT CONCAT(first_name, " ", last_name) AS full_name
FROM employees;
