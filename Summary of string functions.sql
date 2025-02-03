#-(using LENGTH)
SELECT lENGTH('Happy');

SELECT last_name,LENGTH(last_name) AS Length
FROM employee_demographics;

#--(Using UPPER and LOWER)
SELECT UPPER(first_name) AS Uppercase
FROM employee_demographics
;

SELECT LOWER(gender) AS SEX
FROM employee_demographics
;

#--(Using TRIM)
SELECT department_id,RTRIM('      department_name         ')  AS Department_name
FROM parks_departments
;

SELECT department_id,LTRIM('      department_name         ')  AS Department_name
FROM parks_departments
;

#--(using LEFT, RIGHT and SUBSTRING)
SELECT first_name,
LEFT(first_name,2) AS first_2_letters_from_the_left,
RIGHT(first_name,3) AS first_3_letters_from_the_right,
SUBSTRING(first_name,2) AS starting_from_the_second_letter,
SUBSTRING(first_name,2,2) AS 2_letters_staring_from_the_second_letter,
SUBSTRING(birth_date,9,2) AS DAY_OF_BIRTH,
SUBSTRING(birth_date,6,2) AS BIRTH_MONTH,
SUBSTRING(birth_date,1,4) AS YEAR_OF_BIRTH
FROM employee_demographics
;

#--(Using REPLACE and LOCATE)
SELECT first_name,last_name,
REPLACE( first_name,'a','o') AS replace_a_with_o,
REPLACE(last_name,'e','i') AS replace_e_with_i,
LOCATE('a', first_name) AS position_of_a,
LOCATE('en',last_name)
OR LOCATE('er',last_name)
FROM employee_demographics
;

#--(Using CONCAT)
SELECT CONCAT(first_name,' ',last_name) AS FULL_NAME,gender
FROM employee_demographics
GROUP BY gender, first_name,last_name,age,birth_date
ORDER BY gender 
