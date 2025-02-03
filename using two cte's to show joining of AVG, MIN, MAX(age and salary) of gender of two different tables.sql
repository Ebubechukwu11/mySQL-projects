WITH CTE1 AS
(
SELECT gender, MIN(age),MAX(age)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id=sal.employee_id
GROUP BY gender
),
CTE2 AS
(
SELECT gender,MIN(salary),MAX(salary),AVG(salary)
FROM employee_salary AS sal
JOIN employee_demographics AS dem
ON sal.employee_id=dem.employee_id
GROUP BY gender
)
SELECT *
FROM CTE1
JOIN CTE2
ON CTE1.gender=CTE2.gender