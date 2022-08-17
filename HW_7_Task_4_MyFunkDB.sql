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

-- 1) Создайте функции / процедуры для таких заданий: Требуется узнать контактные данные сотрудников (номера телефонов, место жительства).

DELIMITER |
CREATE PROCEDURE contact_employees()
BEGIN
	SELECT e.name_emp, e.phone_emp, d.address_des FROM myfunkdb.comp_employeers AS e
INNER JOIN  myfunkdb.description_emp AS d ON e.id_emp = d.id_emp;
END |

DELIMITER |
CALL contact_employees; |
 
 -- 2) Создайте функции / процедуры для таких заданий: Требуется узнать информацию о дате рождения всех не женатых сотрудников и номера телефонов этих сотрудников.
 
 DELIMITER |
CREATE PROCEDURE not_married_employees()
BEGIN
 SELECT e.name_emp, d.married_des, d.birthday_des, e.phone_emp FROM myfunkdb.comp_employeers AS e
 INNER JOIN myfunkdb.description_emp AS d
 ON e.id_emp = d.id_emp WHERE d.married_des = 'not married';
END |

DELIMITER |
CALL not_married_employees(); |

-- 3) Создайте функции / процедуры для таких заданий: Требуется узнать информацию о дате рождения всех сотрудников с должностью менеджер и номера телефонов этих сотрудников.

 DELIMITER |
CREATE PROCEDURE who_is_manager()
BEGIN
SELECT e.name_emp, t.title_job, d.birthday_des, e.phone_emp FROM myfunkdb.comp_employeers AS e
 INNER JOIN myjoinsdb.title_jobs AS t ON e.id_emp = t.id_emp
 INNER JOIN myfunkdb.description_emp AS d ON e.id_emp = d.id_emp
 WHERE t.title_job = 'менеджер';
END |

DELIMITER |
CALL who_is_manager(); |



