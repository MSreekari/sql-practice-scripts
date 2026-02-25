-- LEAD()/LAG() window functions 
-- 1. Compare salary with previous salary in each department 
SELECT * 
from (
	SELECT e.*, 
    LAG(salary) OVER(
		partition by department_name order by salary 
    ) AS prev_salary 
    from employees AS e 
) AS emp;

-- 2. Find out salary differences fom previous employee 
SELECT * 
from (
	SELECT e.*, 
    salary - LAG(salary) OVER(
		partition by department_name order by salary 
    ) AS diff_salary
    from employees AS e 
) AS e;

-- 3. Salary increase detection 
SELECT * 
from (
	SELECT e.*, 
    LAG(salary) OVER(
		partition by employee_id order by date_joined 
    ) AS prev_salary,
    salary - LAG(salary) OVER(
		partition by employee_id order by date_joined 
    ) AS diff_salary 
    from employees AS e 
) AS emp;

-- 4. Identify employees whose salary increased in the next records 
SELECT * 
from (
	SELECT e.*, 
    LEAD(salary) OVER(
		partition by employee_id order by date_joined 
    ) AS next_salary 
    from employees AS e 
) AS emp 
WHERE next_salary > salary;

-- 5. Identify employees where salary is greater than previous salary and salary is less than next salary 
SELECT * 
from (
	SELECT e.*, 
    LAG(salary) OVER(
		partition by employee_id order by date_joined 
    ) AS prev_salary, 
    LEAD(salary) OVER(
		partition by employee_id order by date_joined 
    ) AS next_salary 
    from employees 
    AS e 
) emp 
WHERE prev_salary < salary 
AND salary < next_salary;

-- 6. Identify employees whose salary decreased from previous salary and then increases in the next salary 
SELECT * 
from ( 
	SELECT e.*, 
    LAG(salary) OVER(
		partition by employee_id order by date_joined 
    ) AS prev_salary, 
    LEAD(salary) OVER(
		partition by employee_id order by date_joined 
    ) AS next_salary 
    from employees AS e 
) AS emp 
WHERE salary < prev_salary 
AND salary < next_salary;

-- 7. Identify employees where salary is greater than the previous salary and next salary is lesser than the current salary 
SELECT * 
from (
	SELECT e.*, 
    LAG(salary) OVER( 
		partition by employee_id order by date_joined 
    ) AS prev_salary, 
    LEAD(salary) OVER( 
		partition by employee_id order by date_joined 
    ) AS next_salary 
    from employees AS e 
) AS emp 
WHERE salary > prev_salary 
AND next_salary < salary;

-- 8. Identify employees whose salary stayed stagnant 
SELECT * 
from (
	SELECT e.*, 
    LAG(salary) OVER(
		partition by employee_id order by date_joined 
    ) AS prev_salary, 
    LEAD(salary) OVER(
		partition by employee_id order by date_joined 
    ) AS next_salary 
    from employees AS e 
) AS emp 
WHERE salary = prev_salary 
AND next_salary = salary; 

-- 9. Find employees whose salary never decreased over time
SELECT employee_id 
from ( 
SELECT employee_id, 
SUM(decrease_flag) AS decreased_flag
from (
SELECT *, 
	CASE 
		WHEN salary IS NOT NULL AND salary < prev_salary
        THEN 1 
        ELSE 0 
	END AS decrease_flag
from (
	SELECT e.*, 
    LAG(salary) OVER(
		partition by employee_id order by date_joined 
    ) AS prev_salary 
    from employees AS e 
) AS emp
) AS flagged_emp 
GROUP BY employee_id 
) AS summary 
WHERE total_decreases = 0;

















