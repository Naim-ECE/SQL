-- new things? (ALTER TABLE (ADD COLUMNS)), changing things? (UPDATE table_name), 
-- wanna delete? (DELETE FROM () {WHERE (Make sure it's in or else whole table will collapse)})
-- wanna join ? (table1 (INNER, LEFT, RIGHT) JOIN table2)
-- wanna concatanate? SELECT CONCAT(first_name, " ", last_name) AS full_name FROM table1;
-- SET SQL_SAFE_UPDATES = 0;
-- Wild card (WHERE name LIKE "_%a")

USE mydb;

-- ON DELETE SET NULL -> When a FK is deleted, replace FK with NULL
-- ON DELETE CASCADE -> When FK is deleetd, delete row

-- ALTER TABLE transactions
-- ADD CONSTRAINT fk_customer_id
-- FOREIGN KEY (customer_id) REFERENCES customers (customer_id);

DELETE FROM customers
WHERE customer_id = 4; -- foreign key can't be deleted

SET FOREIGN_KEY_CHECKS = 0; -- enables deletion of foreign keys

DELETE FROM customers
WHERE customer_id = 4; -- deleted

SET FOREIGN_KEY_CHECKS = 1; -- restricts again

SELECT * FROM customers;

-- checking the reffral of transactions

SELECT * FROM transactions;

-- in customer id '4' still exist. Either use on delete to add null value or delete the entire row by using CASCADE

INSERT INTO customers
VALUES (4, "Vitor", "Baia", 2, "Vbaia@gmail.com");
SELECT * FROM customers;

-- adding ON DELETE NULL initially
CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(6, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
    ON DELETE SET NULL
);

-- setting ON DELETE SET NULL to existing table
ALTER TABLE transactions
DROP FOREIGN KEY fk_customer_id;

ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
ON DELETE SET NULL;

DELETE FROM transactions
WHERE customer_id = 4;
SELECT * FROM transactions;

-- CASCADE (is primary key is deleted then the entire row will delete from the reference table)
SELECT * FROM customers;

ALTER TABLE transactions
DROP FOREIGN KEY fk_customer_id;


-- adding in a existing table
ALTER TABLE transactions
ADD CONSTRAINT fk_transaction_id
FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
ON DELETE CASCADE;

SELECT * FROM transactions;

INSERT INTO transactions
VALUES  (1005, 2004.87, 4, "2023-01-03");

SELECT * FROM transactions;

DELETE FROM customers
WHERE customer_id = 4;

-- now the entire row is gone

SELECT * FROM transactions;
