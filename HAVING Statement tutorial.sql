SELECT occupation,AVG(salary)
FROM employee_salary
GROUP BY occupation
HAVING AVG(salary)<=40000
;

SELECT first_name,AVG(salary)
FROM employee_salary
WHERE first_name LIKE'%%n'
GROUP BY first_name,salary
HAVING AVG(salary)>50000
ORDER BY salary DESC