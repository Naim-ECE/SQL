USE mydb;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM products
WHERE product_id = 104;

INSERT INTO products
VALUES (104, "monitor", 0.00),
	   (105, "big stapler", 0.00),
	   (106, "psp", 0.00),
	   (107, "cpu", 0.00);
       
DELETE FROM products
WHERE product_id >= 104;

CREATE TABLE products (
	product_id INT,
    product_name VARCHAR(25),
    price DECIMAL(6, 2) DEFAULT 0.00 -- will set the price automatically to 0.00 for each item
); -- haven't executed cuz the table was already created

-- adding in existing table
ALTER TABLE products
ALTER price SET DEFAULT 0.00; -- ALTER "column name" SET DEFAULT "value"

INSERT INTO products (product_id, product_name)
VALUES (104, "monitor"),
	   (105, "big stapler"),
	   (106, "psp"),
	   (107, "cpu"); -- set default values

SELECT * FROM products;

-- testing a new table with a default date-time systax
CREATE TABLE transactions (
	transaction_id INT,
    amount DECIMAL(6, 2),
    transaction_date DATETIME DEFAULT NOW()
);

INSERT INTO transactions (transaction_id, amount)
VALUES (1, 3000.00);

INSERT INTO transactions (transaction_id, amount)
VALUES (2, 7000.75);

INSERT INTO transactions (transaction_id, amount)
VALUES (3, 2000.00);

SELECT * FROM transactions;

-- DEFAULT date-time with NOW() is just awesome

DROP TABLE transactions;