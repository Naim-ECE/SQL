USE mydb;

SET AUTOCOMMIT = OFF; -- auto save will turn off

COMMIT; -- by writing this, it will save the changes whenever this statement is used.

SET SQL_SAFE_UPDATES = 0; -- disables the safe mode

DELETE FROM employees; -- !!! deletes the entire data entries because "WHERE" is missing !!!

-- I haven't commited any changes so, "ROLLBACK" will bring the entire table back again

ROLLBACK;

SELECT * FROM employees;
