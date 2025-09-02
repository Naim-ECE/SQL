USE mydb;

CREATE TABLE income (
	income_name VARCHAR(25),
    amount DECIMAL (9, 2)
);

INSERT INTO income
VALUES  ("orders", 1000000.00),
		("merchandise", 50000.00),
        ("services", 125000.00);
        
SELECT * FROM income;

CREATE TABLE expenses (
	expense_name VARCHAR(25),
    amount DECIMAL (8, 2)
);

INSERT INTO expenses
VALUES  ("wages", -250000.00),
		("tax", -50000.00),
		("repairs", -15000.00);
        
SELECT * FROM expenses;

-- union --
SELECT * FROM income
UNION
SELECT * FROM expenses; -- shows the pair of table of income and expenses. Column name has high priority of 1st table name. In this
-- case it's income

DROP TABLE income;
DROP TABLE expenses;

-- employee and customers

SELECT * FROM employees; -- has 6 columns
SELECT * FROM customers; -- has 3 columns

SELECT * FROM employees
UNION
SELECT * FROM customers; -- union won't work cuz it has different number of columns

-- no duplication
SELECT first_name, last_name FROM employees
UNION                                        -- there will be no duplicates
SELECT first_name, last_name FROM customers; -- it will work cuz both of the column has those

-- duplication
SELECT first_name, last_name FROM employees
UNION ALL                                    -- add all things even if they're duplicates
SELECT first_name, last_name FROM customers;

-- new things? (ALTER TABLE (ADD COLUMNS)), changing things? (UPDATE TABLE), 
-- wanna delete? (DELETE FROM () {WHERE (Make sure it's in or else whole table will collapse)})
