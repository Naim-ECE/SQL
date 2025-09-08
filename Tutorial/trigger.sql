-- new things? (ALTER TABLE (ADD COLUMNS)), changing things? (UPDATE table_name), 
-- wanna delete? (DELETE FROM () {WHERE (Make sure it's in or else whole table will collapse)})
-- wanna join ? (table1 (INNER, LEFT, RIGHT) JOIN table2)
-- wanna concatanate? SELECT CONCAT(first_name, " ", last_name) AS full_name FROM table1;
-- SET SQL_SAFE_UPDATES = 0;
-- Wild card (WHERE name LIKE "_%a")

USE mydb;

-- Trigger -> When an event happens, do something
--			  ex. (INSERT, UPDATE, DELETE)
--			  checks data, handles errors, auditing tables

SELECT * FROM employees;

-- task -> adding a salary column. Whenever a new employee is added based on his hourly pay his salary will update automatically with the trigger

ALTER TABLE employees
ADD salary DECIMAL (10, 2)
AFTER hourly_pay;

ALTER TABLE employees
MODIFY COLUMN salary DECIMAL (12, 2);

ALTER TABLE employees
CHANGE COLUMN salary yearly_salary DECIMAL(12, 2);

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET yearly_salary = hourly_pay * 2080;

SELECT * FROM employees;

-- CREATE TRIGGER name
-- BEFORE/AFTER (UPDATE, INSERT, DELETE) ON table_name
-- FOR EACH ROW
-- SET NEW.data_name = (NEW.(method/ calculation))

-- for 'UPDATE' triggers

CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.yearly_salary = (NEW.hourly_pay * 2080);

SHOW TRIGGERS;

UPDATE employees
SET hourly_pay = 900.26
WHERE employee_id = 1;

UPDATE employees
SET hourly_pay = hourly_pay + 1;

SELECT * FROM employees;

-- for  'INSERT' trigger

DELETE FROM employees
WHERE employee_id = 6;

ALTER TABLE employees
DROP COLUMN salary; -- don't have a clue why did it pop up again? after renaming this how can this exists? 'Multiple commands'?

CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.yearly_salary = (NEW.hourly_pay * 2080);

SHOW TRIGGERS;

INSERT INTO employees
VALUES (6, "David", "Raya", 600.75, NULL, "Postman", "2023-05-18" , 5);

SELECT * FROM employees;

-- Trigger needs to be mastered

CREATE TABLE expenses(
	expense_id INT PRIMARY KEY AUTO_INCREMENT,
    expense_name VARCHAR(50),
    expense_total DECIMAL(10, 2)
);

ALTER TABLE expenses
AUTO_INCREMENT = 1;

INSERT INTO expenses (expense_name, expense_total)
VALUES  ("salaries", 0),
		("supplies", 0),
		("taxes", 0);

UPDATE expenses
SET expense_total = (SELECT SUM(yearly_salary) FROM employees)
WHERE expense_name = "salaries";

SELECT * FROM expenses;

-- task -> whenever a employee is deleted, the expense total will update with the tigger

CREATE TRIGGER after_yearly_salary_delete
AFTER DELETE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total - OLD.yearly_salary
WHERE expense_name = "salaries";

SHOW TRIGGERS;

DELETE FROM employees
WHERE first_name = "David";

SELECT * FROM expenses;

-- task -> update salary after inserting new employee's salary info

CREATE TRIGGER after_salary_insert
AFTER INSERT ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + NEW.yearly_salary
WHERE expense_name = "salaries";

SHOW TRIGGERS;

SELECT * FROM employees;

INSERT INTO employees
VALUES (6, "David", "Raya", 500.25, NULL, "Postman", "2025-05-18", 5);

SELECT * FROM expenses;

-- task -> create a trigger that update the salaries on expense table whenever yearly_salary changes. (COMPLICATED TASK)

CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + (NEW.yearly_salary - OLD.yearly_salary)
WHERE expense_name = "salaries";

SHOW TRIGGERS;

SELECT * FROM employees;

UPDATE employees
SET hourly_pay = 502.32
WHERE employee_id = 6;

SELECT * from expenses;
