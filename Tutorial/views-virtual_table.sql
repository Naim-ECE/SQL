-- new things? (ALTER TABLE (ADD COLUMNS)), changing things? (UPDATE TABLE), 
-- wanna delete? (DELETE FROM () {WHERE (Make sure it's in or else whole table will collapse)})
-- wanna join ? (table1 (INNER, LEFT, RIGHT) JOIN table2)
-- wanna concatanate? SELECT CONCAT(first_name, " ", last_name) AS full_name FROM table1;
-- SET SQL_SAFE_UPDATES = 0;


-- a virtual table based on the result-set of an SQL statement
-- The fields in a view are fields from one or more real tables in the database
-- They're not real tables, but can be interacted with as if they were
USE mydb;

SELECT * FROM employees;

CREATE VIEW employee_attendance AS
SELECT first_name, last_name
FROM employees;

SELECT * FROM employee_attendance;

SELECT * FROM employee_attendance
ORDER BY last_name DESC;

-- to drop the view
DROP VIEW employee_attendance;

-- another one

ALTER TABLE customers
ADD email VARCHAR(50);

UPDATE customers
SET email = "RNeves@gmail.com"
WHERE customer_id = 1; -- 1, 2, 3, 4

SELECT * FROM customers;

CREATE VIEW customer_emails AS
SELECT email
FROM customers;

SELECT * FROM customer_emails;

INSERT INTO customers
VALUES (5, "Lionel", "Messi", NULL, "LMessi@gmail.com");

SELECT * FROM customers;

SELECT * FROM customer_emails; -- it's up to date now as well
