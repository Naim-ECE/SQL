USE mydb;

CREATE TABLE products (
	product_id INT,
    product_name VARCHAR(25) UNIQUE, -- "UNIQUES" selects the product name should be unique for each item
    price DECIMAL(6, 2)
);

-- if adding 'unique' is forgotten then we can add it here like below

ALTER TABLE products
ADD CONSTRAINT
UNIQUE (product_name);

INSERT INTO products
VALUES (100, "trimmer", 1300.35),
	   (101, "hammer", 1100.25),
	   (102, "doorbell", 1000.75),
	   (103, "charger", 1400.95);
       -- (101, "hammer", 1100.25); -- This duplication will not apply to this. Because product key is similar to the previous one & it's not unique

SELECT * FROM products;