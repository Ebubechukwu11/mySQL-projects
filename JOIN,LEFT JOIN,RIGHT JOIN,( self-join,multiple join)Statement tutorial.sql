SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_salary
;
SELECT *
FROM parks_departments
;


# JOIN
SELECT SALARY.employee_id, occupation,age
FROM employee_salary AS SALARY
INNER JOIN employee_demographics AS DETAILS
ON SALARY.employee_id=DETAILS.employee_id
;

# (LEFT AND RIGHT-JOIN) OUTER JOIN
SELECT*
FROM employee_salary AS Sal
RIGHT JOIN employee_demographics AS Dem
ON Dem.employee_id=Sal.employee_id
;

# SELF-JOIN
SELECT table1.employee_id AS NUM,
table1.first_name AS SANTA_FIRST_NAME,
table1.last_name AS SANTA_LAST_NAME,
table2.employee_id AS NUM,
table2.first_name AS RECEIVERS_FIRST_NAME,
table2.last_name AS RECEIVERS_LAST_NAME
FROM employee_salary AS table1
JOIN employee_salary AS table2
ON table1.employee_id +1=table2.employee_id
;

# MULTIPLE JOIN(more than 2 tables)
SELECT*
FROM employee_salary AS Sal
JOIN employee_demographics AS Dem
ON Dem.employee_id=Sal.employee_id
JOIN parks_departments AS prkdpt
ON Sal.dept_id=prkdpt.department_id

