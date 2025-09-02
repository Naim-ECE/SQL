-- new things? (ALTER TABLE (ADD COLUMNS)), changing things? (UPDATE TABLE), 
-- wanna delete? (DELETE FROM () {WHERE (Make sure it's in or else whole table will collapse)})
-- wanna join ? (table1 (INNER, LEFT, RIGHT) JOIN table2)
-- wanna concatanate? SELECT CONCAT(first_name, " ", last_name) AS full_name FROM table1;
-- SET SQL_SAFE_UPDATES = 0;

USE mydb;

ALTER TABLE customers
ADD COLUMN referral_id INT;

UPDATE customers
SET referral_id = 1
WHERE customer_id = 2;

UPDATE customers
SET referral_id = 2
WHERE customer_id = 4;

SELECT * FROM customers;

-- self join to show the name in the referral_id

SELECT *
FROM customers AS a
INNER JOIN customers AS b -- joinig another copy of this table to itself
ON a.referral_id = b.customer_id;

SELECT a.customer_id, a.first_name, a.last_name,
	   b.first_name, b.last_name
FROM customers AS a
INNER JOIN customers AS b -- joinig another copy of this table to itself
ON a.referral_id = b.customer_id;

-- lemme try concat

SELECT a.customer_id, a.first_name, a.last_name,
	   CONCAT(b.first_name, " ", b.last_name) AS referred_by
FROM customers AS a
INNER JOIN customers AS b
ON a.referral_id = b.customer_id;

-- left join
SELECT a.customer_id, a.first_name, a.last_name,
	   CONCAT(b.first_name, " ", b.last_name) AS referred_by
FROM customers AS a
LEFT JOIN customers AS b
ON a.referral_id = b.customer_id;

-- another one

SELECT * FROM employees;

ALTER TABLE employees
ADD supervisor_id INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET supervisor_id = 5
WHERE employee_id = 6; -- 2, 3, 4, 6

UPDATE employees
SET supervisor_id = 1
WHERE employee_id = 5;

SELECT * FROM employees;

SELECT a.first_name, a.last_name,
	   CONCAT (b.first_name, " ", b.last_name) AS "reports to"
FROM employees AS a
INNER JOIN employees AS b
ON a.supervisor_id = b.employee_id;

-- left join
SELECT a.first_name, a.last_name,
	   CONCAT (b.first_name, " ", b.last_name) AS "reports to"
FROM employees AS a
LEFT JOIN employees AS b
ON a.supervisor_id = b.employee_id;
