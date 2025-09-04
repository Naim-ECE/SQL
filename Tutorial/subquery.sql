-- new things? (ALTER TABLE (ADD COLUMNS)), changing things? (UPDATE table_name), 
-- wanna delete? (DELETE FROM () {WHERE (Make sure it's in or else whole table will collapse)})
-- wanna join ? (table1 (INNER, LEFT, RIGHT) JOIN table2)
-- wanna concatanate? SELECT CONCAT(first_name, " ", last_name) AS full_name FROM table1;
-- SET SQL_SAFE_UPDATES = 0;
-- Wild card (WHERE name LIKE "_%a")

-- subquery is a query within another query

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET hourly_pay = 998.78
WHERE employee_id = 1;

SELECT * FROM employees;

-- SUB QUERY

SELECT first_name, last_name, hourly_pay, 
	(SELECT AVG(hourly_pay) FROM employees) AS avg_pay
FROM employees;

-- conditional action

SELECT first_name, last_name, hourly_pay
FROM employees
WHERE hourly_pay > (SELECT AVG(hourly_pay) FROM employees);

-- more games with transactions table
SELECT * FROM transactions;

SELECT customer_id
FROM transactions
WHERE customer_id IS NOT NULL;

SELECT DISTINCT customer_id -- doesn't show the repeatation of the same values
FROM transactions
WHERE customer_id IS NOT NULL; -- 1, 2, 3

-- show time of sub query
SELECT first_name, last_name
FROM customers
WHERE customer_id IN (SELECT DISTINCT customer_id
					FROM transactions
					WHERE customer_id IS NOT NULL); -- selects the value (1, 2, 3)
                    
SELECT first_name, last_name
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id
					FROM transactions
					WHERE customer_id IS NOT NULL); -- selects the value !(1, 2, 3)
                    
-- SELECT first_name, last_name
-- FROM customers
-- WHERE customer_id IN (1, 2, 3) -- it's like this
