CREATE PROCEDURE small_salaries()
SELECT *
 FROM employee_salary
 WHERE salary<=30000;

 CALL small_salaries()
 
 
 