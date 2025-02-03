DELIMITER &&
CREATE PROCEDURE small_and_highest_salary(bube INT)
BEGIN
	SELECT *
	 FROM employee_salary
	 WHERE salary<=30000;
	 SELECT salary
	 FROM employee_salary
     WHERE employee_id=bube;
END &&
DELIMITTER ;

CALL small_and_highest_salary(2);