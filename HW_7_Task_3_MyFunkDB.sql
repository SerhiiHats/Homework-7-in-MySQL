CREATE DATABASE MyFunkDB;

USE MyFunkDB;

CREATE TABLE Comp_employeers (
id_emp INT AUTO_INCREMENT PRIMARY KEY,
name_emp VARCHAR(50) NOT NULL,
phone_emp VARCHAR(15) NOT NULL UNIQUE);

CREATE TABLE Title_emp (
id_job INT AUTO_INCREMENT PRIMARY KEY,
id_emp INT NOT NULL,
salary_job DOUBLE NOT NULL DEFAULT 0,
title_job VARCHAR(30) NOT NULL DEFAULT 'Trenee',
FOREIGN KEY (id_emp) REFERENCES Comp_employeers (id_emp));

CREATE TABLE Description_emp (
id_des INT AUTO_INCREMENT PRIMARY KEY,
id_emp INT NOT NULL UNIQUE,
married_des VARCHAR (15) NOT NULL,
birthday_des DATE NOT NULL,
address_des VARCHAR(50),
FOREIGN KEY (id_emp) REFERENCES Comp_employeers (id_emp));

INSERT INTO Comp_employeers (name_emp, phone_emp)
VALUES
('Сергей', '+380678514751'),
('Алексей', '+380679548521'),
('Денис', '+380679512575'),
('Ольга', '+380738529614'),
('Оксана', '+380638547596');

INSERT INTO Title_emp (id_emp, salary_job, title_job)
VALUES 
(1, 14345.50, 'главный директор'),
(2, 11275.75, 'менеджер'),
(3, 7851.60, 'рабочий'),
(4, 8900.45, 'рабочий'),
(5, 9587.75, 'рабочий');

INSERT INTO Description_emp (id_emp, married_des, birthday_des, address_des)
VALUES 
(1, 'not married', '1988-04-15', 'Ukraine, Odessa, Bugaivska, 5'),
(2, 'married', '1995-11-21', 'Ukraine, Odessa, Ekaterininskaya, 84'),
(3, 'not married', '1980-06-10', 'Ukraine, Odessa, Nikolaevskaya doroga, 15'),
(4, 'married', '1991-10-04', 'Ukraine, Odessa, B.Khmelnitskogo, 34'),
(5, 'not married', '1987-07-27', 'Ukraine, Odessa, Kanatnaya, 19');




