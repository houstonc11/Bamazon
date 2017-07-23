DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (

item_id INTEGER(30) AUTO_INCREMENT NOT NULL,

product_name VARCHAR(50) NOT NULL,

department_name VARCHAR(50) NOT NULL,

price INTEGER(10),

stock_quantity INTEGER(10),

PRIMARY KEY (item_id)

);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Apple IPAD", "electronics", 600, 25);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Nintendo Switch", "electronics", 300, 20);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Tide Detergent", "cleaning supplies", 20, 40);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Swiffer Mop", "cleaning supplies", 20, 50);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Nike Football", "sporting goods", 35, 10);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Sony TV", "electronics", 1200, 5);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Bassett Love Seat", "furniture", 800, 8);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("IKEA Coffee Table", "furniture", 200, 6);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Pedigree Dog Food", "food", 20, 25);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Mizuno Baseball Bat", "sporting goods", 100, 12);

SELECT * FROM products

