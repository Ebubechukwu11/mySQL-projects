SELECT*
FROM employee_salary
WHERE first_name='ron'
;

SELECT*
FROM employee_salary
WHERE salary>50000
;

SELECT*
FROM employee_salary
WHERE salary>=50000
;

SELECT*
FROM employee_demographics
WHERE gender !='female'
;

SELECT*
FROM employee_demographics
WHERE (birth_date>'1980-08-03' AND age<10) OR age>38
;

SELECT*
FROM employee_demographics
WHERE first_name LIKE'a%'OR first_name LIKE'C%'
;

