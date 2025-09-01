USE mydb;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(25),
    last_name VARCHAR(25)
);

INSERT INTO customers (first_name, last_name)
VALUES  ("Ruben", "Neves"),
		("Declan", "Rice"),
		("Bukayo", "Saka");

SELECT * FROM customers;

DROP TABLE transactions;

CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(6, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id) -- creates initial foreign key
);

-- drop a foreign key
ALTER TABLE transactions
DROP FOREIGN KEY transactions_ibfk_1;

-- to create a foreign key
ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customers (customer_id);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM transactions;

ALTER TABLE transactions
AUTO_INCREMENT = 1000;

INSERT INTO transactions (amount, customer_id)
VALUES  (1500.90, 3),
		(2890, 2),
		(2880, 3),
		(4990, 1);

SELECT * FROM transactions;

-- a foreign key can't be deleted unless the foreign key is dropped manually from the reference
DELETE FROM customers
WHERE customer_id = 3; -- can't be deleted or updated a foreign key
