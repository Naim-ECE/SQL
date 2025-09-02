USE mydb;

ALTER TABLE employees
ADD COLUMN job VARCHAR(25) AFTER hourly_pay;

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET job = "Manager"
WHERE employee_id = 1;

UPDATE employees
SET job = "Cashier"
WHERE employee_id = 2;

UPDATE employees
SET job = "Cook"
WHERE employee_id = 3;

UPDATE employees
SET job = "Cook"
WHERE employee_id = 4;

UPDATE employees
SET job = "Assistant manager"
WHERE employee_id = 5;

UPDATE employees
SET job = "Postman"
WHERE employee_id = 6;

-- logical actions 'AND'
SELECT *
FROM employees
WHERE hire_date < "2025-08-10" AND job = "Cook";

-- OR
SELECT *
FROM employees
WHERE job = "Cashier" OR job = "Cook";

-- NOT
SELECT *
FROM employees
WHERE NOT job = "Manager";

SELECT *
FROM employees
WHERE NOT job = "Manager" AND NOT job = "Assistant manager";

-- BETWEEN (similar to AND)
SELECT *
FROM employees
WHERE hire_date BETWEEN "2025-05-14" AND "2025-07-22";

-- IN
SELECT *
FROM employees
WHERE job IN ("Cook", "Cashier", "Postman");

SELECT * FROM employees;
