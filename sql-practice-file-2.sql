-- ROW_NUMBER() problems
-- 1. Highest salary of each department
SELECT * 
from (
	SELECT e.*, 
    row_number() OVER(
    partition by department_name ORDER BY salary DESC
    ) AS row_num 
    from employees AS e
    ) 
AS emp WHERE row_num = 1;

-- 2. Finding duplicate values
SELECT employee_name, COUNT(*) AS count_value
from employees 
GROUP BY employee_name 
HAVING COUNT(*) > 1;

-- 3. Finding duplicate rows 
SELECT * 
from (
	SELECT e.*,
    row_number() OVER(
    partition by employee_name 
    ) AS row_num
    from employees AS e 
) emp 
WHERE row_num > 1;

-- 4. Delete duplicate records keeping only one 
DELETE 
from employees 
WHERE employee_id IN(
	SELECT employee_id 
    from (
		SELECT e.*,
        row_number() OVER(
			partition by employee_name
        ) AS row_num 
        from employees e
    ) emp 
    WHERE row_num > 1
);

-- 5. Find recently joined employee in each department
SELECT * 
from (
	SELECT e.*, 
    row_number() OVER(
		partition by department_name order by date_joined DESC 
    ) AS row_num 
    from employees AS e 
) AS emp 
WHERE row_num = 1;

-- 6. Find top 3 highest paid employees in each department 
SELECT * 
from (
	SELECT e.*, 
    row_number() OVER(
		partition by department_name order by salary DESC 
    ) AS row_num 
    from employees AS e 
) AS emp 
WHERE row_num <= 3;























