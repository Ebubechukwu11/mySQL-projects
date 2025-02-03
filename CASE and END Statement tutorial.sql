#--(Using CASE statement)
SELECT first_name,last_name,occupation,salary,
CASE 
WHEN dept_id=4 THEN salary+(salary*0.25)
WHEN dept_id=2 OR dept_id=3 THEN salary+(salary*0.25) 
END new_salary
FROM employee_salary
ORDER BY new_salary DESC
;

SELECT first_name,last_name,
		age,
CASE
WHEN age<=35 THEN 'Young'
WHEN age BETWEEN 36 AND 50 THEN 'Average'
WHEN age BETWEEN 51 AND 70 THEN 'Old'
END AS age_category
FROM employee_demographics
;


SELECT d.first_name,d.last_name,
		age,
CASE
WHEN age<=35 THEN 'Young'
WHEN age BETWEEN 36 AND 50 THEN 'Average'
WHEN age BETWEEN 51 AND 70 THEN 'Old'
END AS age_category,
c.occupation,c.salary,
CASE 
WHEN salary>=70000 THEN salary-(salary*0.10) 
WHEN salary BETWEEN 40000 AND 69000 THEN salary
WHEN salary BETWEEN 0 AND 39000 THEN salary+(salary*0.10)
END AS New_Salary
FROM employee_demographics AS d
JOIN employee_salary AS c
ON d.employee_id=c.employee_id
ORDER BY New_salary
