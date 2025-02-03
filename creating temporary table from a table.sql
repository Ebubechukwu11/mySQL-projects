#---(Creating temporary table for a table)
CREATE TEMPORARY TABLE temp_table
SELECT*
FROM employee_salary
WHERE salary>=60000
;

SELECT*
FROM temp_table