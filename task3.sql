use hotel_management;
show tables;
desc guests;

ALTER TABLE guests ADD city VARCHAR(50);
INSERT INTO guests (guest_id, guest_name, guest_phone, guest_email, city) VALUES
(1, 'Aman Sharma', '9876543210', 'aman.sharma@gmail.com', 'Delhi'),
(2, 'Priya Mehta', '9876501234', 'priya.mehta@yahoo.com', 'Mumbai'),
(3, 'Ravi Verma', '9876012345', 'ravi.v@outlook.com', 'Chennai'),
(4, 'Simran Kaur', '9876523456', 'simran.kaur@gmail.com', 'Amritsar'),
(5, 'John Dsouza', '9876034567', 'john.d@gmail.com', 'Goa'),
(6, 'Neha Singh', '9876545678', 'neha.singh@gmail.com', 'Delhi'),
(7, 'Ali Khan', '9876056789', 'ali.khan@hotmail.com', 'Hyderabad'),
(8, 'Anjali Patel', '9876567890', 'anjali.patel@gmail.com', 'Ahmedabad'),
(9, 'David Joseph', '9876078901', 'david.j@gmail.com', 'Kolkata'),
(10, 'Meera Nair', '9876589012', 'meera.nair@gmail.com', 'Bangalore');

SELECT * FROM guests;
 -- Using Specific Columns
select guest_name, guest_email FROM guests;

select guest_id, guest_name, city FROM guests;

-- 1. WHERE – Filter by One Condition
SELECT *
FROM guests
WHERE city = 'Delhi';

-- 2 WHERE - COMBINE CONDITION ''WHERE AND''
SELECT guest_name, guest_email, city
FROM guests
WHERE city = 'delhi' AND guest_email LIKE '%gmail.com';
-- 3 WHERE - OR
SELECT guest_name, guest_email, city
FROM guests
WHERE city = 'mumbai' OR city = 'goa';

-- LIKE – Pattern Matching
SELECT guest_name
FROM guests
WHERE guest_name LIKE 'A%';

SELECT guest_email
FROM guests
WHERE guest_email LIKE '%yahoo%';

-- adding age column
ALTER TABLE guests ADD guest_age INT;
UPDATE guests SET guest_age = 25 WHERE guest_id = 1;
UPDATE guests SET guest_age = 30 WHERE guest_id = 2;
UPDATE guests SET guest_age = 35 WHERE guest_id = 3;
UPDATE guests SET guest_age = 28 WHERE guest_id = 4;
UPDATE guests SET guest_age = 41 WHERE guest_id = 5;
UPDATE guests SET guest_age = 22 WHERE guest_id = 6;
UPDATE guests SET guest_age = 38 WHERE guest_id = 7;
UPDATE guests SET guest_age = 31 WHERE guest_id = 8;
UPDATE guests SET guest_age = 26 WHERE guest_id = 9;
UPDATE guests SET guest_age = 29 WHERE guest_id = 10;


-- BETWEEN – Filter Within a Range

-- Guests aged between 25 and 35
SELECT guest_name, guest_age
FROM guests
WHERE guest_age BETWEEN 25 AND 35;

-- Guests aged 25–40 from Delhi or Mumbai with Gmail accounts
SELECT guest_name, guest_email, guest_age, city
FROM guests
WHERE guest_age BETWEEN 25 AND 40
AND city IN ('Delhi', 'Mumbai')
AND guest_email LIKE '%gmail.com';

--  ORDER BY – Sort Results
SELECT guest_id, guest_name, city
FROM guests
ORDER BY guest_name ASC;
-- Guests sorted by age
SELECT guest_name, guest_age
FROM guests
ORDER BY guest_age ASC;

-- LIMIT – Restrict Number of Rows
-- Top 5 oldest guests
SELECT guest_name, guest_age
FROM guests
ORDER BY guest_age DESC
LIMIT 5;
-- first 3
SELECT guest_name
FROM guests
ORDER BY guest_name ASC
LIMIT 3;