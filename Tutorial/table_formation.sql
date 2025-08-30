CREATE TABLE employees(
	employee_id INT(20),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE
);

SELECT * FROM employees;
RENAME TABLE employees TO workers;

SELECT * FROM workers;

RENAME TABLE workers TO employees;
SELECT * FROM employees;

-- DROP TABLE employees;

ALTER TABLE employees
ADD phone_number VARCHAR(15);

ALTER TABLE employees
RENAME COLUMN phone_number TO email;

-- changing datatypes of changed columns

ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100);

-- changing position of a column

ALTER TABLE employees
MODIFY email VARCHAR(100)
AFTER last_name; -- become the 1st column use "FIRST" keyword

-- DROP a column

ALTER TABLE employees
DROP COLUMN email;

-- inserting values in a table

INSERT INTO employees
VALUES (1, "Declan", "Rice", 870.35, "2025-08-12"), 
	   (2, "Ruben", "Neves", 978.50, "2025-07-30"), 
	   (3, "Lamine", "Yamal", 996.00, "2025-06-20"), 
	   (4, "William", "Saliba", 903.95, "2025-08-10"), 
	   (5, "Alejandro", "Balde", 715.65, "2025-05-14");

-- DELETE FROM employees
-- WHERE hourly_pay IN (87.35, 97.50, 99.00, 90.95, 70.65); --failed attempt

INSERT INTO employees(employee_id, first_name, last_name)
VALUES (6, "Hurry", "Kane");

SELECT first_name, last_name FROM employees;

SELECT first_name, first_name FROM employees;

SELECT last_name, first_name FROM employees;

SELECT *
FROM employees
WHERE employee_id = 1;

SELECT *
FROM employees
WHERE first_name = "Hurry";

SELECT *
FROM employees
WHERE hourly_pay >= 890;

SELECT *
FROM employees
WHERE hire_date >= "2025-08-01";

SELECT *
FROM employees
WHERE employee_id != 1;

SELECT *
FROM employees
WHERE hire_date IS NULL;

SELECT *
FROM employees
WHERE hire_date IS NOT NULL;

SELECT last_name, hourly_pay
FROM employees
WHERE hire_date IS NOT NULL;

-- updating values

SET SQL_SAFE_UPDATES = 0; -- if it's = 1 then it'll prevent from using WHERE and UPDATE statement

UPDATE employees
SET hourly_pay = 825.95,
	hire_date = "2025-06-25"
WHERE employee_id = 6;


DELETE FROM employees -- Only putting this statement will delete the entire data entries or rows 
WHERE employee_id = 6;
-- UPDATE employees
-- SET hourly_pay = 825.95 -- will set this value to everyone

SELECT * FROM employees;
