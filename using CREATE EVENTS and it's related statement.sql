	DELIMITER && 
	CREATE EVENT remove_old_staffs
	ON SCHEDULE EVERY 90 DAY
	DO
BEGIN
DELETE
FROM employee_demographics
WHERE age>=60;
END &&
DELIMITER ;
;

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;