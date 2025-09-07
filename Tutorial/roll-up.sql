-- new things? (ALTER TABLE (ADD COLUMNS)), changing things? (UPDATE table_name), 
-- wanna delete? (DELETE FROM () {WHERE (Make sure it's in or else whole table will collapse)})
-- wanna join ? (table1 (INNER, LEFT, RIGHT) JOIN table2)
-- wanna concatanate? SELECT CONCAT(first_name, " ", last_name) AS full_name FROM table1;
-- SET SQL_SAFE_UPDATES = 0;
-- Wild card (WHERE name LIKE "_%a")

USE mydb;

-- ROLLUP -> extension of GROUP BY clause
-- produces another row and shows the GRAND TOTAL (super-aggregate value)

SELECT * FROM transactions;

SELECT SUM(amount), order_date
FROM transactions
GROUP BY order_date WITH ROLLUP; -- adds total amount of sum in the next column

SELECT COUNT(transaction_id), order_date
FROM transactions
GROUP BY order_date WITH ROLLUP;

SELECT COUNT(transaction_id) AS "#  of orders", customer_id
FROM transactions
GROUP BY customer_id WITH ROLLUP;
-- HAVING customer_id IS NOT NULL; -- doesn't work (gotta figure this out!)

-- 'employees' table

SELECT * FROM employees;

SELECT SUM(hourly_pay) AS "hourly_pay", employee_id
FROM employees
GROUP BY employee_id WITH ROLLUP;

