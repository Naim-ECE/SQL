USE mydb;

CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY, -- PRIMARY KEY =  no duplication of values and it can't be null
    amount DECIMAL(6, 2),
    transaction_date DATETIME DEFAULT NOW()
);

-- adding "PRIMARY KEY" to a existing table
ALTER TABLE transactions
ADD CONSTRAINT
PRIMARY KEY (transaction_id);

-- only one column can have a primary key. Multiple column can't have this behaviour
ALTER TABLE transactions
ADD CONSTRAINT
PRIMARY KEY (amount); -- amount can't have the primary key cuz transaction already has it

INSERT INTO transactions (transaction_id, amount)
VALUES (100, 2000.65);

INSERT INTO transactions (transaction_id, amount)
VALUES (101, 4572.65);

INSERT INTO transactions (transaction_id, amount)
VALUES (101, 1000.65); -- won't work cuz of the duplication of primary key

INSERT INTO transactions (transaction_id, amount)
VALUES (102, 1000.65);

INSERT INTO transactions (transaction_id, amount)
VALUES (NULL, 6700.65); -- it can't have the "NULL" value either. So, won't work

SELECT * FROM transactions;

SELECT amount
FROM transactions
WHERE transaction_id = 100; -- the value can be easily seen cuz of uniqueness of each entry
