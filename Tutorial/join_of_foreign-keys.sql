USE mydb;

DELETE FROM transactions;

-- TRUNCATE TABLE transactions; -- if delete doesn't work then it will work for sure !!! "SET SQL_SAFE_UPDATES = 0" !!!

ALTER TABLE transactions
AUTO_INCREMENT = 1000;

INSERT INTO transactions (amount, customer_id)
VALUES  (1500.90, 3),
		(2890, 2),
		(2880, 3),
		(4990, 1);

INSERT INTO transactions (amount, customer_id)
VALUES (1000.95, NULL);

SELECT * FROM transactions;

INSERT INTO customers (first_name, last_name)
VALUES ("Vitor", "Baia");

SELECT * FROM customers;

-- join -> 1. inner join, 2. left join, 3. right join

-- inner join --
SELECT *
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

SELECT transaction_id, amount, first_name, last_name
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

-- left join -- (selects everything to the table on the left)
SELECT *
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;

-- right join -- (selects everything to the table on the right)
SELECT *
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;
