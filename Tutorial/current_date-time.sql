USE mydb;

CREATE TABLE test(
	my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);

INSERT INTO test
VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW());

INSERT INTO test
VALUES (CURRENT_DATE() - 1, NULL, NULL); -- +1 -> tomorrow, -1 -> yesterday

SELECT * FROM test;

DROP TABLE test;