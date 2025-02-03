#--(Using TRIM)
SELECT department_id,RTRIM('      department_name         ')  AS Department_name
FROM parks_departments
;

SELECT department_id,LTRIM('      department_name         ')  AS Department_name
FROM parks_departments
;
