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
