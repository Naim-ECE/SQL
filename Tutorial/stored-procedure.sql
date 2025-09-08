-- new things? (ALTER TABLE (ADD COLUMNS)), changing things? (UPDATE table_name), 
-- wanna delete? (DELETE FROM () {WHERE (Make sure it's in or else whole table will collapse)})
-- wanna join ? (table1 (INNER, LEFT, RIGHT) JOIN table2)
-- wanna concatanate? SELECT CONCAT(first_name, " ", last_name) AS full_name FROM table1;
-- SET SQL_SAFE_UPDATES = 0;
-- Wild card (WHERE name LIKE "_%a")

USE mydb;

-- stored procedure -> is prepared SQL code that can be saved. It's great if there's a query that's been written often

SELECT DISTINCT first_name, last_name
FROM transactions
INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

-- !!! DELIMITER -> declares which will end sql code? Default is ';' but writing DELIMITER % it'll become '%' !!!
DELIMITER // -- it became '%'. To end a statement
CREATE PROCEDURE get_customers()
BEGIN
	SELECT * FROM customers;
END //
DELIMITER ; -- it becomes ';' again

CALL get_customers();

-- to drop a procedure
DROP PROCEDURE get_customers;

DELIMITER %
CREATE PROCEDURE find_customer(IN id INT) -- 'IN (parameter or nickname) Datatype' to see a specific value
BEGIN
	SELECT *
    FROM customers
    WHERE customer_id = id;
END %

DELIMITER ;

CALL find_customer(1);

DROP PROCEDURE find_customer;

DELIMITER &&
CREATE PROCEDURE find_customer (IN f_name VARCHAR(50), 
								IN l_name VARCHAR(50))

-- CREATE PROCEDURE find_customer (IN f_name VARCHAR(50), 
-- 								 l_name VARCHAR(50)) 		-- both works

BEGIN
	SELECT *
    FROM customers
    WHERE first_name = f_name AND last_name = l_name;
END &&

DELIMITER ;

CALL find_customer("Declan", "Rice");

-- benefits
-- reduces network traffic
-- increases performance
-- secure, admin can grant permission to use

-- disadvantage
-- increases memory usage of every connection
