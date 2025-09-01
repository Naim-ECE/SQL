USE mydb;

CREATE TABLE employees (
	employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE
    
    CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 800) -- to check if everybody has at least this wage
    
); -- haven't executed cuz the table was already created

-- adding "CHECK" in a existing table

ALTER TABLE employees
ADD CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 100);

-- ALTER TABLE employees
-- ADD CONSTRAINT chk_hourly_pay_again CHECK (hourly_pay >= 800.90); -- This constraint can't be added any more once it already declared

INSERT INTO employees
VALUES (6, "David", "Raya", 800.00, "2025-05-12"); -- < 100 isn't assignable

-- to delete the check constraint
 ALTER TABLE employees
 DROP CHECK chk_hourly_pay;

SELECT * FROM employees;