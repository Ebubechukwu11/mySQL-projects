SELECT *
FROM employee_demographics
UNION 
SELECT *
FROM employee_salary
;



SELECT first_name,last_name,'old' AS Label
FROM employee_demographics
WHERE age>40
UNION
SELECT first_name,last_name,'High earning employees' AS Label
FROM employee_salary
WHERE salary>60000
;


SELECT first_name,last_name,'Old Man' AS Label
FROM employee_demographics
WHERE age>40 AND gender='male' 
UNION 
SELECT first_name,last_name, 'Old lady' AS Label
FROM employee_demographics
WHERE age>40 AND gender='female'
UNION 
SELECT first_name,last_name,'High earning employees' AS Label
FROM employee_salary
WHERE salary>60000
ORDER BY first_name,last_name
