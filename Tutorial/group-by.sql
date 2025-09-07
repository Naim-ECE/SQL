-- new things? (ALTER TABLE (ADD COLUMNS)), changing things? (UPDATE table_name), 
-- wanna delete? (DELETE FROM () {WHERE (Make sure it's in or else whole table will collapse)})
-- wanna join ? (table1 (INNER, LEFT, RIGHT) JOIN table2)
-- wanna concatanate? SELECT CONCAT(first_name, " ", last_name) AS full_name FROM table1;
-- SET SQL_SAFE_UPDATES = 0;
-- Wild card (WHERE name LIKE "_%a")

USE mydb;

-- GROUP BY = aggregate all rows by a specific column (often used with aggregate functions, such SUM(), MAX() etc)

ALTER TABLE transactions
ADD order_date DATE; -- creates 6 null rows

INSERT INTO transactions(order_date)
VALUES  ("2023-01-01"),
		("2023-01-01"),
        ("2023-01-02"),
        ("2023-01-02"),
        ("2023-01-03"),
        ("2023-01-03"); -- inserted after 6 null rows
        
        
DELETE FROM transactions
WHERE transaction_id = 1013;

ALTER TABLE transactions
DROP COLUMN order_date;

ALTER TABLE transactions
ADD order_date DATE; -- creates 6 null rows

SET SQL_SAFE_UPDATES = 0;

DELETE FROM transactions WHERE order_date IS NULL;

INSERT INTO transactions(order_date)
VALUES  ("2023-01-01"),
		("2023-01-01"),
        ("2023-01-02"),
        ("2023-01-02"),
        ("2023-01-03"),
        ("2023-01-03"); 

SELECT * FROM transactions;

DELETE FROM transactions;

ALTER TABLE transactions
AUTO_INCREMENT = 1000;

INSERT INTO transactions (amount, customer_id, order_date)
VALUES  (1500.90, 3, "2023-01-01"),
		(2890, 2, "2023-01-01"),
        (2880, 3, "2023-01-02"),
        (4990, 1, "2023-01-02"),
        (1000.05, NULL, "2023-01-03"),
        (2078.45, 4, "2023-01-03"),
        (6342, NULL, "2023-01-03");
        
SELECT * FROM transactions;

SELECT COUNT(amount), order_date
FROM transactions
GROUP BY order_date;

SELECT SUM(amount), customer_id
FROM transactions
GROUP BY customer_id;

SELECT COUNT(amount), customer_id
FROM transactions
GROUP BY customer_id
-- WHERE COUNT(amount) > 1; -- 'WHERE' clause doesn't work
HAVING COUNT(amount) > 1; -- 'HAVING' works with 'GROUP BY'

SELECT COUNT(amount), customer_id
FROM transactions
GROUP BY customer_id
HAVING COUNT(amount) > 1 AND customer_id IS NOT NULL;
