
--CREATE TABLE syntax
--CREATE TABLE table_name(col_name DATA_TYPE, col2 DATA_TYPE, ...) -- if primary key, type after DATA_TYPE

--CREATE customer table
CREATE TABLE customer (
--	column_name DATATYPE <CONSTRAINTS>
	customer_id SERIAL PRIMARY KEY, 
	first_name varchar(50),
	last_name varchar(50),
	address varchar(100), 
	email varchar(50), 
	prime_member boolean
);


--ADD COLUMN TO a TABLE 
--ALTER TABLE table_name ADD COLUMN column_name DATATYPE
ALTER TABLE customer
ADD COLUMN username varchar(20);

--CHANGE email TO varchar(30) use TYPE before varchar
ALTER TABLE customer 
ALTER COLUMN email TYPE varchar(30);

--CHANGE name OF column
ALTER TABLE customer 
RENAME COLUMN email TO email_address;

--CHECK OUT the NEW TABLE 
SELECT *
FROM customer ;




--CREATE ORDER TABLE w FOREIGN KEY TO customer, 
CREATE TABLE order_ (
	order_id SERIAL PRIMARY KEY,
	order_date timestamp DEFAULT current_timestamp, -- create timestamp and setup to default to current time ZONE
	customer_id integer NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY 
	-- syntax: FOREIGN KEY(column_in_domestic_table) REFERENCES foreign_table_name(column_in_foreign_table)
	FOREIGN key(customer_id) REFERENCES customer(customer_id)
);




-- create order-product table (join table bw order and product table)
CREATE TABLE order_product(
	order_id integer NOT NULL, 
	FOREIGN KEY(order_id) REFERENCES order_(order_id),
	product_id integer NOT NULL, 
--	FOREIGN KEY(product_id) REFERENCES product(product_id), -- CANNOT REFERENCE TABLE THAT DOES NOT EXIST
	quantity integer
);




-- create product table (wo foreign key right now)
CREATE TABLE product(
	product_id SERIAL PRIMARY KEY, 
	prod_name varchar(25),
	description varchar(200),
	price numeric(5, 2)
);





-- alter the order_product table to add the foreign key column
ALTER TABLE order_product 
ADD FOREIGN KEY(product_id) REFERENCES product(product_id);




-- rename table product to table item
ALTER TABLE product 
RENAME TO item;

ALTER TABLE item 
RENAME TO product;




-- create a test table
CREATE TABLE test(
	test_id SERIAL PRIMARY KEY,
	column_1 integer,
	column_2 boolean
);


SELECT * FROM test;


--DROP A COLUMN - BE CAREFUL W DROP, NO UNDOING IT.....
ALTER TABLE test 
DROP COLUMN column_1;

SELECT * FROM test;


-- remove a table completely - CAREFUL NO UNDOING IT.....IF EXISTS will drop table if it exists, ignore and continue if not
DROP TABLE IF EXISTS test;

SELECT * FROM test;








