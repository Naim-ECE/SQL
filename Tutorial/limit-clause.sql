USE mydb;

SELECT * FROM customers;

SELECT * FROM customers
LIMIT 2; -- just shows the number of limited amount of data

SELECT * FROM customers
ORDER BY last_name DESC LIMIT 3;

SELECT * FROM customers
LIMIT 2, 1; -- limit of 1 records after 2 rows of data


