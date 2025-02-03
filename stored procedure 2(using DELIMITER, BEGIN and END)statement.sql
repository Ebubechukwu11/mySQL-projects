DELIMITER &&
CREATE PROCEDURE small_and_medium_salaries()
BEGIN
	SELECT *
	 FROM employee_salary
	 WHERE salary<=30000;
	 SELECT *
	 FROM employee_salary
     WHERE salary >=31000;
END &&
DELIMITTER ;



 