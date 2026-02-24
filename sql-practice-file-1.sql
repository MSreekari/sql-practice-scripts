insert into employees values(101, 'Mohan', 'Admin', 4000, );
insert into employees values(102, 'Rajkumar', 'HR', 3000);
insert into employees values(103, 'Akbar', 'IT', 4000);
insert into employees values(104, 'Dorvin', 'Finance', 6500);
insert into employees values(105, 'Rohit', 'HR', 3000);
insert into employees values(106, 'Rajesh',  'Finance', 5000);
insert into employees values(107, 'Preet', 'HR', 7000);
insert into employees values(108, 'Maryam', 'Admin', 4000);
insert into employees values(109, 'Sanjay', 'IT', 6500);
insert into employees values(110, 'Vasudha', 'IT', 7000);
insert into employees values(111, 'Melinda', 'IT', 8000);
insert into employees values(112, 'Komal', 'IT', 10000);
insert into employees values(113, 'Gautham', 'Admin', 2000);
insert into employees values(114, 'Manisha', 'HR', 3000);
insert into employees values(115, 'Chandni', 'IT', 4500);
insert into employees values(116, 'Satya', 'Finance', 6500);
insert into employees values(117, 'Adarsh', 'HR', 3500);
insert into employees values(118, 'Tejaswi', 'Finance', 5500);
insert into employees values(119, 'Cory', 'HR', 8000);
insert into employees values(120, 'Monica', 'Admin', 5000);
insert into employees values(121, 'Rosalin', 'IT', 6000);
insert into employees values(122, 'Ibrahim', 'IT', 8000);
insert into employees values(123, 'Vikram', 'IT', 8000);
insert into employees values(124, 'Dheeraj', 'IT', 11000);
COMMIT;

UPDATE employees
SET date_joined = DATE_ADD(
    '2020-01-01',
    INTERVAL FLOOR(RAND() * 1500) DAY
);

SELECT * 
from employees;

-- Pattern matching - LIKE operator
-- 1. Display employee names that start with 'M' 
SELECT * 
from employees 
WHERE employee_name LIKE 'm%';

-- 2. Display employee names that end with 'M' 
SELECT *
from employees  
WHERE employee_name LIKE '%m';

-- 3. Display employee names having 'M' i any position of their names
SELECT * 
from employees 
WHERE employee_name LIKE '%m%';

-- 4. Display employee names that do not contain 'M'
SELECT * 
from employees 
WHERE employee_name NOT LIKE '%m%';

-- 5. Display employee_name whose contains exactly 4 letters 
SELECT employee_name 
from employees 
WHERE employee_name LIKE '____';

-- 6. Display the employee_names that contain the second letter as 'O' and the third letter as 'R'
SELECT * 
from employees 
WHERE employee_name LIKE '%OR%';

-- 7. Display the employee_names that contain 2 'L's 
SELECT employee_name 
from employees 
WHERE employee_name LIKE '%LL%';

-- 8. Display the employee_names that starts with 'M' and ends with 'A' 
SELECT employee_name 
from employees 
WHERE employee_name LIKE 'M%A';













