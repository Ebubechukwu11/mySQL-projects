#--(Using cte's like WITH statement)

WITH CTE_example AS 
(
SELECT gender,MIN(age) AS mininmum_age,MAX(age) AS maximum_age,AVG(age) AS average_age
FROM employee_demographics
GROUP BY gender
)
SELECT*
FROM CTE_example
;

#---------( example 2 )
WITH CTE_example2 AS
(
SELECT first_name, MIN(salary),MAX(salary),AVG(salary)
FROM employee_salary
GROUP BY first_name
)
SELECT first_name, MIN(`MIN(salary)`),MAX(`MAX(salary)`),AVG(`AVG(salary)`)
FROM CTE_example2
GROUP BY first_name
;

#-------(Example 3)
WITH CTE_example3(GENDER, MINIMUM_AGE,MAXIMUM_AGE,AVERAGE_AGE) AS
(
SELECT gender,MIN(age),MAX(age),AVG(age)
FROM employee_demographics 
GROUP BY gender
),
CTE_example3b(GENDER) AS
(
SELECT gender
FROM employee_demographics 
GROUP BY gender
),
CTE_example3c AS
(
 SELECT MIN(salary) AS MINIMUM_SALARY,MAX(salary) AS MAXIMUM_SALARY,AVG(salary)AS AVERAGE_SALARY
FROM employee_salary
)
SELECT*
FROM CTE_example3
JOIN CTE_example3b
ON CTE_example3.gender=CTE_example3b.gender
JOIN CTE_example3c
