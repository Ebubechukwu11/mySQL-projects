#--(Using REPLACE and LOCATE)
SELECT first_name,last_name,birth_date,
REPLACE( first_name,'A','o') AS replace_a_with_o,
REPLACE(last_name,'e','i') AS replace_e_with_i,
REPLACE(birth_date,'19','20'),
LOCATE('a', first_name) AS locate_position_of_a,
LOCATE('en',last_name)
OR LOCATE('er',last_name)
FROM employee_demographics
;