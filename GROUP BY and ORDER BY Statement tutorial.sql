SELECT occupation, MAX(salary),COUNT(salary),AVG(salary)
FROM employee_salary 
GROUP BY occupation
;


SELECT first_name,last_name, age
FROM employee_demographics
GROUP BY first_name, last_name, age
ORDER BY age DESC
;


SELECT first_name,occupation, salary
FROM employee_salary 
GROUP BY first_name,occupation,salary
ORDER BY salary,first_name ASC
;




