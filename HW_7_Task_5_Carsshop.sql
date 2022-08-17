DROP DATABASE carsshop;

CREATE DATABASE carsshop;

USE carsshop;

CREATE TABLE marks(
   mark_id INT AUTO_INCREMENT PRIMARY KEY,
   mark VARCHAR(50) UNIQUE);

CREATE TABLE cars(
  cars_id INT AUTO_INCREMENT PRIMARY KEY,
  mark_id INT NOT NULL,
  model VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  FOREIGN KEY(mark_id) REFERENCES marks(mark_id));
  
  CREATE TABLE clients(	
	 clients_id INT AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(50),
     age TINYINT,
     phone VARCHAR(15)); 

CREATE TABLE orders(
     orders_id INT AUTO_INCREMENT PRIMARY KEY,
     car_id INT NOT NULL,
     clients_id INT NOT NULL,
    FOREIGN KEY(car_id) REFERENCES cars(cars_id),
    FOREIGN KEY(clients_id) REFERENCES clients(clients_id));

INSERT INTO marks(mark) VALUES 
('Audi'), 
('Porsche'),
('Hyindai');

INSERT INTO cars(mark_id, model, price) VALUES (1, 'A5', 50000); 
INSERT INTO cars(mark_id, model, price) VALUES (1, 'Q7', 75000); 
INSERT INTO cars(mark_id, model, price) VALUES (2, 'panamera', 100000); 
INSERT INTO cars(mark_id, model, price) VALUES (2, 'caymen S', 88000); 
INSERT INTO cars(mark_id, model, price) VALUES (3, 'tucson', 31000); 
INSERT INTO cars(mark_id, model, price) VALUES (3, 'santafe', 45000); 
INSERT INTO cars(mark_id, model, price) VALUES (3, 'ioniq', 55000); 

INSERT INTO clients(name, age) VALUES ('Sergey', 20), ('Vasiliy', 25), ('Vitaly', 75), ('Oleg', 39), ('Olga', 35);

INSERT INTO orders(car_id, clients_id) VALUES (1, 1), (2, 2), (1, 3), (7, 4), (5, 5); 
INSERT INTO orders(car_id, clients_id) VALUES (3, 3), (4, 2); 
INSERT INTO orders(car_id, clients_id) VALUES (6, 2); 
INSERT INTO orders(car_id, clients_id) VALUES (7, 1); 

-- Используя базу данных carsshop создайте функцию для нахождения минимального возраста клиента, затем сделайте выборку всех машин, которые он купил.

SELECT MIN(cl.age) AS min_age FROM carsshop.clients AS cl;

SELECT cl.name, m.mark, c.model FROM carsshop.marks AS m
INNER JOIN carsshop.cars AS c ON m.mark_id = c.mark_id
INNER JOIN carsshop.orders AS o ON o.car_id = c.cars_id
INNER JOIN carsshop.clients AS cl ON o.clients_id = cl.clients_id
WHERE cl.age = (SELECT MIN(cl.age) AS min_age FROM carsshop.clients AS cl);





