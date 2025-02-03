SELECT *
FROM employee_demographics
WHERE employee_id IN
					(SELECT employee_id
                    FROM employee_salary
                    WHERE dept_id=1)
                    ;
                    
SELECT first_name,last_name,
(SELECT AVG(salary)
FROM employee_salary),
(SELECT MAX(age)
FROM employee_demographics)
FROM employee_demographics
;


SELECT gender,COUNT(avg_age)
FROM
(SELECT gender, MIN(age),MAX(age),COUNT(age), AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender)AS agg_table
GROUP BY gender
