DELIMITER &&
CREATE TRIGGER new_staff
 AFTER INSERT ON employee_salary
FOR EACH ROW
BEGIN
INSERT INTO employee_demographics(employee_id,first_name,last_name)
VALUES(NEW.employee_id,NEW.first_name,NEW.last_name,18,'Male','2006-08-10');
END &&
DELIMITER ;

INSERT INTO employee_salary(employee_id,first_name,last_name,occupation,salary,dept_id)
VALUES(13,'Leon','Ike','Data Analyst', 150000,2);

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;





