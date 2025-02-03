SELECT*
FROM employee_salary
ORDER BY salary DESC,occupation DESC
LIMIT 9
;

SELECT first_name,last_name AS sur_name,AVG(age) AS average_age
FROM employee_demographics
GROUP BY first_name,sur_name
HAVING average_age>35
ORDER BY first_name
LIMIT 7
;



