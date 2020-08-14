/*
-- Query: SELECT * FROM vgb1.customers
LIMIT 0, 1000

-- Date: 2020-07-10 14:55
*/
INSERT INTO `customers` (`id`,`name`,`password`,`email`,`birthday`,`gender`) 
	VALUES ('A123456789','張三豐','123456','test01@uuu.com.tw','1990-07-21','M');
	
INSERT INTO `customers` (`id`,`name`,`password`,`email`,`birthday`,`gender`, 
				`phone`,`address`,`married`,`blood_type`) 
	VALUES ('A223456781','林梅莉','123456','test03@uuu.com.tw','1995-03-21','F',
				'0987654321','台北市復興北路99號14F',1,'A');
