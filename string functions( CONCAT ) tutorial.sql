#--(Using CONCAT)
SELECT CONCAT(first_name,' ',last_name) AS FULL_NAME,gender
FROM employee_demographics
GROUP BY gender, first_name,last_name,age,birth_date
ORDER BY gender 