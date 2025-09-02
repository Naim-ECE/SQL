USE mydb;

SELECT * FROM employees
ORDER BY last_name; -- by default ascending order

-- or --
SELECT * FROM employees
ORDER BY last_name ASC;

SELECT * FROM employees
ORDER BY last_name DESC; -- for descending order

SELECT * FROM transactions;

UPDATE transactions
SET amount = 2890.00
WHERE transaction_id = 1004;

SELECT * FROM transactions
ORDER BY amount, customer_id; -- if 'amount' has same values then it will again order by 'customer_id'

SELECT * FROM transactions
ORDER BY amount ASC, customer_id DESC; -- playing some more
