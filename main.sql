CREATE TABLE shop(s_id int NOT NULL PRIMARY KEY,s_name varchar(100),s_address varchar(100),s_email varchar(100));
INSERT INTO shop VALUES(1,'Pizza Hut','1st street,potheri,chennai','p@gmail.com');
INSERT INTO shop VALUES(2,'Andhra mess','2st street,potheri,chennai','a@gmail.com');
INSERT INTO shop VALUES(3,'SRM Hotel','3st street,potheri,chennai','s@gmail.com');
INSERT INTO shop VALUES(4,'Dominoz','4st street,potheri,chennai','d@gmail.com');
INSERT INTO shop VALUES(5,'Ice Magic','5th street,potheri,chennai','i@gmail.com');
SELECT * FROM shop;
desc shop;
ALTER TABLE shop ADD(phone INT);
SELECT * FROM shop;
ALTER TABLE shop RENAME COLUMN phone to pho;
ALTER TABLE shop DROP COLUMN pho;



UPDATE shop SET s_email='z@gmail.com' WHERE s_id=4;
DELETE FROM shop WHERE s_id=4;
INSERT INTO shop VALUES(4,'Dominoz','4st street,potheri,chennai','d@gmail.com');




SELECT * FROM shop WHERE s_email LIKE 's%';
SELECT * FROM shop WHERE s_id=1 OR s_id=3;
SELECT * FROM shop WHERE s_id=1 AND s_email='p@gmail.com';
SELECT * FROM shop WHERE s_id NOT IN 1;
SELECT * FROM shop WHERE s_id BETWEEN 1 AND 3;
SELECT * FROM shop ORDER BY s_id desc;

-- INSERT INTO shop VALUES(4,'Dominoz','4st street,potheri,chennai','d@gmail.com');
-- savepoint p1;
-- DELETE FROM shop WHERE s_id=4;
-- ROLLBACK TO SAVEPOINT p1;
-- SELECT * FROM shop;
-- SELECT TOP 2 * FROM shop;

SELECT SUM(s_id) FROM shop WHERE s_id<5;
SELECT AVG(s_id) FROM shop WHERE s_id<4;
SELECT SUM(s_id) FROM shop WHERE s_id<5;
SELECT COUNT(s_id) FROM shop WHERE s_id<5;
SELECT MIN(s_id) FROM shop WHERE s_id<5;
SELECT MAX(s_id) FROM shop WHERE s_id<5;
SELECT s_id AS SHOP_ID FROM shop;
SELECT * FROM shop;
INSERT INTO shop VALUES(8,'Dominoz','5st street,potheri,chennai','d@gmail.com');
INSERT INTO shop VALUES(9,'Andhra mess','6st street,potheri,chennai','a@gmail.com');
INSERT INTO shop VALUES(10,'SRM Hotel','7st street,potheri,chennai','s@gmail.com');
INSERT INTO shop VALUES(11,'SRM Hotel','3st street,potheri,chennai','s@gmail.com');
SELECT COUNT(s_id),s_name FROM shop GROUP BY s_name;
SELECT COUNT(s_id),s_name FROM shop GROUP BY s_name HAVING s_name='SRM Hotel';

CREATE TABLE customers(c_id INT NOT NULL PRIMARY KEY,c_name VARCHAR(100) default 'Unknown',c_address VARCHAR(100),phone INT ,dob VARCHAR(100),age INT);
CREATE TABLE products(p_id int not null primary key,p_price int,p_name varchar(100));
CREATE TABLE delivary_boy(d_id int not null primary key,d_name varchar(100));
CREATE TABLE placed(pp_id int not null primary key,pp_name varchar(100));
CREATE TABLE notplaced(np_id int not null primary key,np_name varchar(100));


INSERT INTO customers VALUES(1,'Kiran','1st street SRM',1234567891,'16th Aug',20);
INSERT INTO customers VALUES(2,'Ram','2st street SRM',1234567892,'17th Aug',20);
INSERT INTO customers VALUES(3,'Bheem','3st street SRM',1234567893,'18th Aug',20);
INSERT INTO customers VALUES(4,'Krishna','4st street SRM',1234567894,'19th Aug',20);
INSERT INTO customers VALUES(5,'Raju','5st street SRM',1234567895,'20th Aug',20);


INSERT INTO products VALUES(1,100,'Pizza');
INSERT INTO products VALUES(2,200,'Burger');
INSERT INTO products VALUES(3,300,'Chapathi');
INSERT INTO products VALUES(4,400,'Briyani');
INSERT INTO products VALUES(5,500,'Idli');
INSERT INTO products VALUES(6,600,'Milk Shake');
INSERT INTO products VALUES(7,700,'Rice');
INSERT INTO products VALUES(8,800,'Water bottle');
INSERT INTO products VALUES(9,900,'vada');
INSERT INTO products VALUES(10,1000,'Dosa');


INSERT INTO delivary_boy VALUES(1,'Kiran');
INSERT INTO delivary_boy VALUES(2,'Ram');
INSERT INTO delivary_boy VALUES(3,'Bheem');
INSERT INTO delivary_boy VALUES(4,'Raj');
INSERT INTO delivary_boy VALUES(5,'Krishna');


INSERT INTO placed VALUES(1,'Pizza');
INSERT INTO placed VALUES(2,'Burger');
INSERT INTO placed VALUES(3,'Milk Shake');
INSERT INTO placed VALUES(4,'Chapathi');
INSERT INTO placed VALUES(5,'Biriyani');

INSERT INTO notplaced VALUES(1,'Rice');
INSERT INTO notplaced VALUES(2,'Water bottle');
INSERT INTO notplaced VALUES(3,'vada');
INSERT INTO notplaced VALUES(4,'idli');
INSERT INTO notplaced VALUES(5,'Dosa');







CREATE TABLE customer_orders(c_id int not null,p_id int not null,p_price int,p_name varchar(100));
ALTER TABLE customer_orders ADD FOREIGN KEY (p_id) REFERENCES products(p_id);
ALTER TABLE customer_orders ADD FOREIGN KEY (c_id) REFERENCES customers(c_id);

INSERT INTO customer_orders VALUES(1,1,100,'Pizza');
INSERT INTO customer_orders VALUES(2,2,200,'Burger');
INSERT INTO customer_orders VALUES(3,3,300,'Chapathi');
INSERT INTO customer_orders VALUES(4,4,400,'Biriyani');
INSERT INTO customer_orders VALUES(5,5,500,'Idli');

CREATE TABLE product_has(p_id int not null,s_id int not null,p_price int,p_name varchar(100));
ALTER TABLE product_has ADD FOREIGN KEY (p_id) REFERENCES products(p_id);
ALTER TABLE product_has ADD FOREIGN KEY (s_id) REFERENCES shop(s_id);

INSERT INTO product_has VALUES(1,1,100,'Pizza');
INSERT INTO product_has VALUES(2,2,200,'Burger');
INSERT INTO product_has VALUES(3,3,300,'Chapathi');
INSERT INTO product_has VALUES(4,4,400,'Biriyani');
INSERT INTO product_has VALUES(5,5,500,'Idli');






CREATE TABLE shop_sends(s_id int not null,d_id int not null,s_name varchar(100),s_address varchar(100),s_email varchar(100));
ALTER TABLE shop_sends ADD FOREIGN KEY (s_id) REFERENCES shop(s_id);
ALTER TABLE shop_sends ADD FOREIGN KEY (d_id) REFERENCES delivary_boy(d_id);

INSERT INTO shop_sends VALUES(1,1,'Pizza Hut','1st street,potheri,chennai','p@gmail.com');
INSERT INTO shop_sends VALUES(2,2,'Andhra mess','2st street,potheri,chennai','a@gmail.com');
INSERT INTO shop_sends VALUES(3,3,'SRM Hotel','3st street,potheri,chennai','s@gmail.com');
INSERT INTO shop_sends VALUES(4,4,'Dominoz','4st street,potheri,chennai','d@gmail.com');
INSERT INTO shop_sends VALUES(5,5,'Ice Magic','5th street,potheri,chennai','i@gmail.com');


CREATE TABLE delivary_boy_calls(d_id int not null,c_id int not null,d_name varchar(100));
ALTER TABLE delivary_boy_calls ADD FOREIGN KEY (d_id) REFERENCES delivary_boy(d_id);
ALTER TABLE delivary_boy_calls ADD FOREIGN KEY (c_id) REFERENCES customers(c_id);

INSERT INTO delivary_boy_calls VALUES(1,1,'Kiran');
INSERT INTO delivary_boy_calls VALUES(2,2,'Ram');
INSERT INTO delivary_boy_calls VALUES(3,3,'Bheem');
INSERT INTO delivary_boy_calls VALUES(4,4,'Raj');
INSERT INTO delivary_boy_calls VALUES(5,5,'Krishna');




CREATE TABLE customer_has(pp_id int not null,np_id int not null,c_id int not null,pp_name varchar(100),np_name varchar(100));
ALTER TABLE customer_has ADD FOREIGN KEY (pp_id) REFERENCES placed(pp_id);
ALTER TABLE customer_has ADD FOREIGN KEY (np_id) REFERENCES notplaced(np_id);
ALTER TABLE customer_has ADD FOREIGN KEY (c_id) REFERENCES customers(c_id);


INSERT INTO customer_has VALUES(1,1,1,'Pizza','Rice');
INSERT INTO customer_has VALUES(2,2,2,'Burger','Water bottle');
INSERT INTO customer_has VALUES(3,3,3,'Milk Shake','vada');
INSERT INTO customer_has VALUES(4,4,4,'Chapathi','idli');
INSERT INTO customer_has VALUES(5,5,5,'Biriyani','Dosa');



CREATE TABLE customer_pays(c_id int not null,s_id int not null,s_address varchar(100),s_email varchar(100),s_name varchar(100));
ALTER TABLE customer_pays ADD FOREIGN KEY (c_id) REFERENCES customers(c_id);
ALTER TABLE customer_pays ADD FOREIGN KEY (s_id) REFERENCES shop(s_id);

INSERT INTO customer_pays VALUES(1,1,'1st street,potheri,chennai','p@gmail.com','Pizza Hut');
INSERT INTO customer_pays VALUES(2,2,'2st street,potheri,chennai','a@gmail.com','Andhra mess');
INSERT INTO customer_pays VALUES(3,3,'3st street,potheri,chennai','s@gmail.com','SRM Hotel');
INSERT INTO customer_pays VALUES(4,4,'4st street,potheri,chennai','d@gmail.com','Dominoz');
INSERT INTO customer_pays VALUES(5,5,'5th street,potheri,chennai','i@gmail.com','Ice Magic');



CREATE TABLE veg(p_id int not null,p_price int ,p_name varchar(100),p_cat varchar(100));
INSERT INTO veg VALUES(1,100,'Pizza','veg');
INSERT INTO veg VALUES(2,200,'Burger','veg');
INSERT INTO veg VALUES(3,300,'Chapathi','veg');
INSERT INTO veg VALUES(4,400,'Biriyani','veg');
INSERT INTO veg VALUES(5,500,'Idli','veg');


INSERT INTO products VALUES(11,1100,'Non-veg Dosa');
INSERT INTO products VALUES(12,1200,'Non-veg Pizza');
INSERT INTO products VALUES(13,1300,'Non-veg Burger');
INSERT INTO products VALUES(14,1400,'Non-veg Biriyani');
INSERT INTO products VALUES(15,1500,'Non-veg Chapathi');

CREATE TABLE non_veg(p_id int not null,p_price int ,p_name varchar(100),p_cat varchar(100));
INSERT INTO non_veg VALUES(11,1100,'Non-veg Dosa','Non-veg');
INSERT INTO non_veg VALUES(12,1200,'Non-veg Pizza','Non-veg');
INSERT INTO non_veg VALUES(13,1300,'Non-veg Burger','Non-veg');
INSERT INTO non_veg VALUES(14,1400,'Non-veg Biriyani','Non-veg');
INSERT INTO non_veg VALUES(15,1500,'Non-veg Chapathi','Non-veg');


SELECT UPPER(p_name) FROM products;
SELECT LOWER(p_name) FROM products;
SELECT CONCAT(p_id,p_name) FROM products;
SELECT REVERSE(p_name) FROM products;
SELECT TRIM(p_name) FROM products;
SELECT ROUND(p_id) FROM products;

SELECT p_id,p_name FROM customer_orders WHERE p_id>(SELECT MIN(p_id) FROM products);
SELECT COUNT(s_id),s_name FROM shop GROUP BY s_name HAVING COUNT(s_id)>(SELECT MIN(p_id) FROM products);

SELECT * FROM products,customer_orders WHERE products.p_id=customer_orders.p_id;
SELECT * FROM products INNER JOIN customer_orders ON products.p_id=customer_orders.p_id;
SELECT * FROM products NATURAL JOIN customer_orders;
SELECT * FROM products CROSS JOIN customer_orders;
SELECT * FROM products LEFT JOIN customer_orders ON products.p_id=customer_orders.p_id;
SELECT * FROM products RIGHT JOIN customer_orders ON products.p_id=customer_orders.p_id;
SELECT * FROM products FULL OUTER JOIN customer_orders ON products.p_id=customer_orders.p_id;


 
SELECT p_name FROM products
UNION 
SELECT p_name FROM customer_orders;

SELECT p_name FROM products
UNION ALL
SELECT p_name FROM customer_orders;

SELECT p_name FROM products
INTERSECT
SELECT p_name FROM customer_orders;

SELECT p_name FROM products
MINUS
SELECT p_name FROM customer_orders;



CREATE VIEW MY_FAVORITES AS SELECT p_id,p_name FROM products WHERE p_id>5;
SELECT * FROM MY_FAVORITES;
SELECT p_name FROM MY_FAVORITES;
INSERT INTO MY_FAVORITES VALUES(16,'Panjabi paratha');
UPDATE MY_FAVORITES SET p_name='Milk' WHERE p_id=6;
DROP VIEW MY_FAVORITES;



DECLARE 
  customer_rec customers%rowtype; 
BEGIN 
  SELECT * into customer_rec 
  FROM customers 
  WHERE c_id = 5;  
  dbms_output.put_line('Customer ID: ' || customer_rec.c_id); 
  dbms_output.put_line('Customer Name: ' || customer_rec.c_name); 
  dbms_output.put_line('Customer Address: ' || customer_rec.c_address); 
  dbms_output.put_line('Customer phone: ' || customer_rec.phone);
  dbms_output.put_line('Customer DOB: ' || customer_rec.dob);
  dbms_output.put_line('Customer Age: ' || customer_rec.age);
END; 
/
