CREATE TEMPORARY TABLE details_table
(
first_name VARCHAR(20),
last_name VARCHAR(20),
gender VARCHAR(20)
)
;
INSERT INTO details_table
VALUES('Avery', 'Mals','female')
;
SELECT *
FROM details_table
       