CREATE TABLE users
(
	user_id INT  PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30),
	gender VARCHAR(1) NOT NULL,
	contact_no INT NOT NULL ,
	address VARCHAR(100) NOT NULL,
	created_at VARCHAR(100) NOT NULL,
	email VARCHAR(50) ,
	password VARCHAR(20) NOT NULL
);

CREATE TABLE salons
(
	salon_id INT PRIMARY KEY ,
	salon_Name VARCHAR(100) NOT NULL,
	address VARCHAR(100) NOT NULL,
	website_link VARCHAR(100),
	contact_no INT NOT NULL
);

CREATE TABLE staff 
(
	staff_id INT PRIMARY KEY,
	salon_id INT NOT NULL,                 
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100),
	age int NOT NULL,
	gender BOOLEAN NOT NULL,
	contact_no int NOT NULL,
	experience int,
	photo_URL VARCHAR(100),
	FOREIGN KEY (salon_id) REFERENCES salons(salon_id)
);

CREATE TABLE services
(
	service_name VARCHAR(30) NOT NULL,
	variety VARCHAR(30) NOT NULL,
	price INT NOT NULL,
	salon_id INT NOT NULL,
	staff_id INT NOT NULL,
	PRIMARY KEY(service_name,variety,price),
	FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
	FOREIGN KEY (salon_id) REFERENCES salons(salon_id)
);

CREATE TABLE availability
(
	availability_id int PRIMARY KEY,
	staff_id int NOT NULL,
	slot int NOT NULL,
	available BOOLEAN NOT NULL,
	FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);
CREATE TABLE Bill
(
	booking_id INT PRIMARY KEY,
	user_id int NOT NULL,
	salon_id int NOT NULL,
	staff_id int NOT NULL,
	service_name VARCHAR(30) NOT NULL,
	variety VARCHAR(30) NOT NULL,
	slot int NOT NULL,
	availability_id int not null,
	price int NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (salon_id) REFERENCES salons(salon_id),
	FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
	FOREIGN KEY (service_name,variety,price) REFERENCES services(service_name,variety,price),
	FOREIGN KEY (availability_id) REFERENCES availability(availability_id)
);