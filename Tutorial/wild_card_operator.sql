USE mydb;

SELECT * FROM employees
WHERE first_name LIKE "a%"; -- '%' represents any number of random characters (in the beginning of the sentence)

SELECT * FROM employees
WHERE hire_date LIKE "2025%";

SELECT * FROM employees
WHERE first_name LIKE "%e";  -- (finds in the end of the sentence)

SELECT * FROM employees
WHERE first_name LIKE "de%"; -- remember only few words? well, it will get it done

SELECT * FROM employees
WHERE job LIKE ("_ook");  -- "_" represents a random character (like filling the blanks)

-- find them who joined in May
SELECT * FROM employees
WHERE hire_date LIKE "____-05-__";

-- combining wild cards '%' & '_'
-- 2nd character is has to be an 'a'
SELECT * FROM employees
WHERE job LIKE "_a%";
