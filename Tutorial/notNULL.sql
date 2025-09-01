USE mydb;

-- CREATE TABLE products (
-- 	product_id INT,
--     product_name VARCHAR(25),
--     price DECIMAL(6, 2) NOT NULL -- Defines the values of this column can't be NULL
-- ); -- haven't executed

-- adding "not null" after creating a table

ALTER TABLE products
MODIFY price DECIMAL(6, 2) NOT NULL;

INSERT INTO products  -- (product_id, product_name)
VALUES (104, "keyboard", 1230.85);

SELECT * FROM products;