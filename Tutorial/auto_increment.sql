USE mydb;

DROP TABLE transactions;

CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT, -- "AUTO_INCREMENT" only can be added to a kry. Initially it's '1'
    amount DECIMAL(6, 2),
    transaction_date DATETIME DEFAULT NOW()
);

INSERT INTO transactions (amount)
VALUES  (4213.89),
		(5848.95),
		(2000.25);

-- to start at a different value
ALTER TABLE transactions
AUTO_INCREMENT = 1000;

DELETE FROM transactions;

INSERT INTO transactions (amount)
VALUES  (4213.89),
		(5848.95),
		(2000.25);

SELECT * FROM transactions;
