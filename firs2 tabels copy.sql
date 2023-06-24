 /* and Project GROUP members
No	FULL NAME			ID
1	Habtamu Ayenew		1200/13
2	Abduwekil Abrar		0060/13
3	Abel Fikere			0094/13
4	Daniel Tadesse		0693/13
5	Eyuel Abera			1198/13
6	Fuad Mustefa		1066/13
7	Genet Mengestu		1148/13
======================================================
  */

CREATE DATABASE hotel_db;
use hotel_db;
CREATE TABLE guests (
  guest_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone_number VARCHAR(20)
);
INSERT INTO guests (guest_id, first_name, last_name, email, phone_number)
VALUES (1, 'habtamu', 'ayenew', 'johndoe@example.com', '555-1234'),
       (2, 'abdu', 'wokil', 'janesmith@example.com', '555-5678'),
       (3, 'genet', 'mengstu', 'bobjohnson@example.com', '555-9012');
CREATE TABLE rooms (
  room_number INT PRIMARY KEY,
  room_type VARCHAR(50),
  price DECIMAL(10,2),
  max_occupancy INT
);

INSERT INTO rooms (room_number, room_type, price, max_occupancy)
VALUES (101, 'Standard', 100.00, 2),
       (102, 'Standard', 100.00, 2),
       (103, 'Deluxe', 150.00, 4),
       (104, 'Suite', 250.00, 6);
CREATE TABLE reservations (
  reservation_id INT PRIMARY KEY,
  guest_id INT,
  room_number INT,
  check_in_date DATE,
  check_out_date DATE,
  FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
  FOREIGN KEY (room_number) REFERENCES rooms(room_number)
);
INSERT INTO reservations (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (1, 1, 101, '2022-01-01', '2022-01-03'),
       (2, 2, 103, '2022-01-02', '2022-01-05'),
       (3, 3, 104, '2022-01-03', '2022-01-06');

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone_number VARCHAR(20),
  hire_date DATE,
  job_title VARCHAR(50),
  salary DECIMAL(10,2)
);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_title, salary)
VALUES (1, 'Abel', 'Fikre', 'af@example.com', '555-1111', '2021-01-01', 'Front Desk Clerk', 25000.00),
       (2, 'Daniel', 'tadesse', 'dt@example.com', '555-2222', '2021-02-01', 'Housekeeper', 20000.00),
       (3, 'Eyuel', ' Abera', 'ea@example.com', '555-3333', '2021-03-01', 'Manager', 50000.00);
CREATE TABLE shifts (
  shift_id INT PRIMARY KEY,
  employee_id INT,
  start_time TIME,
  end_time TIME,
  shift_date DATE,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
INSERT INTO shifts (shift_id, employee_id, start_time, end_time, shift_date)
VALUES (1, 1, '08:00:00', '16:00:00', '2022-01-01'),
       (2, 2, '09:00:00', '17:00:00', '2022-01-01'),
       (3, 3, '10:00:00', '18:00:00', '2022-01-01');
       
	-- we are done table creation and insertion 
    -- referential integrity is enforced by adding foreign key constraints to the reservations and shifts tables that reference the guests and employees tables. This ensures that a reservation or shift cannot be created for a guest or employee that does not exist in the respective tables.
select * from guests;
select * from employees;
select * from reservations;
select * from rooms;


-- join

SELECT reservations.reservation_id,
 guests.first_name,
 guests.last_name, 
 reservations.check_in_date,
 reservations.check_out_date
FROM reservations
INNER JOIN guests ON reservations.guest_id = guests.guest_id;
-- Left join:

SELECT rooms.room_number, rooms.room_type, reservations.check_in_date, reservations.check_out_date
FROM rooms
LEFT JOIN reservations ON rooms.room_number = reservations.room_number;


-- This will return a result set that includes all rooms, along with the check-in and check-out dates for any reservations that exist for each room. If a room has no reservations, the check-in and check-out dates will be NULL.

-- Right join:

SELECT rooms.room_number, rooms.room_type, reservations.check_in_date, reservations.check_out_date
FROM rooms
RIGHT JOIN reservations ON rooms.room_number = reservations.room_number;


-- This will return a result set that includes all reservations, along with the room number and room type for each reservation. If a reservation does not have a corresponding room, the room number and room type will be NULL.

-- Inner join:

SELECT rooms.room_number, rooms.room_type, reservations.check_in_date, reservations.check_out_date
FROM rooms
INNER JOIN reservations ON rooms.room_number = reservations.room_number;

/*

GROUP member
No	FULL NAME			ID
1	Habtamu Ayenew		1200/13
2	Abduwekil Abrar		0060/13
3	Abel Fikere			0094/13
4	Daniel Tadesse		0693/13
5	Eyuel Abera			1198/13
6	Fuad Mustefa		1066/13
7	Genet Mengestu		1148/13
*/
