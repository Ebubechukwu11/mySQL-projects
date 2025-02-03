SELECT dem.first_name,dem.last_name,gender,AVG(salary)OVER(PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id=sal.employee_id
;

SELECT dem.employee_id,dem.first_name,dem.last_name,gender,salary,SUM(salary) OVER(PARTITION BY gender ORDER BY sal.employee_id ) AS sum_salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY sal.salary) AS row_digit,
RANK()OVER(PARTITION BY gender ORDER BY salary ASC) AS rank_position,
DENSE_RANK()OVER(PARTITION BY gender ORDER BY sal.salary)
FROM employee_salary AS sal
JOIN employee_demographics AS dem
ON dem.employee_id=sal.employee_id




