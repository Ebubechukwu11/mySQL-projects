#---(Data Cleaning)

#---(Removing duplicates)
#---1.We created a new schema 
#---2.Then we imported the dataset using "Table data import wizard"
#---3.We create a new table cos it is not advisable to work on a raw dataset.
#---4.Then we import the data from the raw dataset to the new dataset
#---5.Then we select everything from the new dataset and apply ROW_NUMBER and partition by all the column in the table
#---6.We then use cte because alaised names cannot work in the WHERE statement normally,  but using cte it works
#---7.We then use the cte to display only the duplicates using WHERE statement.
#---8.After the duplicates have been diplayed, we create a new table because it is not possible to use DELETE statement on ctes
#---9. The table is created by right-clicking on the new table, then clicking "copy to clipboard", then click "create statement" and paste.
#---10. A set of code will appear containing the new table information
#---11. We edit the new table name to a newer one.
#---12.Then include the alaised name that is in the cte and add "INT" so we know it has to do with numbers
#---13.Then run it to create a newer table.The alaised name is then joined to the newer table
#---14. We insert data from the newly old table to to the newer one including the row_number partitioned by all the columns
#---15. Then we can now use the WHERE statement with the alaised name to display the duplicates
#---16. We then delete the duplicates using the DELETE statement


SELECT *
FROM world_layoffs.layoffs;

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT layoffs_staging
SELECT*
FROM layoffs;

SELECT*
FROM layoffs_staging;

SELECT *,
ROW_NUMBER()OVER(PARTITION BY company,location,industry,total_laid_off,`date`) AS row_number_effect
FROM layoffs_staging;


WITH duplicates AS
(SELECT *,
ROW_NUMBER()OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_number_effect
FROM layoffs_staging
)
SELECT *
FROM duplicates
WHERE row_number_effect > 1;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_number_effect` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO layoffs_staging2
SELECT *,ROW_NUMBER()OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_number_effect
FROM layoffs_staging
;

SELECT *
FROM layoffs_staging2
WHERE row_number_effect >1;

DELETE
FROM layoffs_staging2
WHERE row_number_effect>1;
SELECT *
FROM layoffs_staging2
WHERE row_number_effect >1;

#---(Standardizing data)
#---1. We check each column to make sure everything is right
#---2. If there's any problem we try and fix it using string functions like TRIM, TRAILING, ETC..
#---3.Problems like( trim, mis-spelling or different names but same meaning
#---4.After wrting it we have to update the table so it will take effect
#---5.We use keywords like UPDATE and SET and sometimes the WHERE and LIKE statement,so it will take effect
#---6.To make changes on date, maybe it wasn't following the right format of arrangement for dates, we use STR_TO_DATE()
#---7. THE STR_TO_DATE will arrange the date in the proper format, then we use (%,/)to write it
#---8. We write it in the format it was written in the table.e.g ('%m/%/d%y'). THe STR_TO_DATE will automatically write it the correct way
#---9. We then use the UPDATE and SET statement so it will take effect
#---10. If the date is in a text datatype we cahnge it to date by altering and modifying the column.
#---11. We use ALTER TABLE and MODIFY COLUMN to change the format of the datatype
SELECT*
FROM layoffs_staging2;

SELECT DISTINCT company,TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company=TRIM(company);

SELECT DISTINCT location
FROM layoffs_staging2
WHERE location LIKE'Florian%';

UPDATE layoffs_staging2
SET location='Florianapolis'
WHERE location LIKE'Florian%';

SELECT DISTINCT location
FROM layoffs_staging2
WHERE location LIKE'Non-%';

UPDATE layoffs_staging2 
SET location=' '
WHERE location LIKE 'non-%';

SELECT DISTINCT location
FROM layoffs_staging2
WHERE location LIke'Malm__';

UPDATE layoffs_staging2 
SET location='Malmo'
WHERE location LIKE 'Malm__';

SELECT DISTINCT location
FROM layoffs_staging2
WHERE location LIKE'D_________%';

UPDATE layoffs_staging2 
SET location='Dusseldorf'
WHERE location LIKE 'd_________%';

SELECT DISTINCT industry
FROM layoffs_staging2
WHERE industry LIKE'cry%';

UPDATE layoffs_staging2
SET industry='Crypto'
WHERE industry LIKE'CRYPTO%';

SELECT DISTINCT country, TRIM(TRAILING'.'FROM country)
FROM layoffs_staging2
WHERE country LIKE'united s%';

UPDATE layoffs_staging2
SET country=TRIM(TRAILING'.'FROM country)
WHERE country LIKE'United s%';

SELECT DISTINCT *
FROM layoffs_staging2;

SELECT `date`,TRIM(`date`)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date`=TRIM(`date`);

SELECT `date`
FROM layoffs_staging2;

SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date`=STR_TO_DATE(`date`,'%m/%d/%Y');

SELECT `date`
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

#-----(Removing null and blanks from columns)
#---1. We firstly remove the nulls for only both total_laid_off and percentage_laid_off because it is useless to the table meaning nobody was sacked or dismissed
#---2. We use the DELETE, WHERE, IS NULL and AND statement so it will work
#---3.But if it is only one that is null then we keep it but can't find the nulls because there isn't a total amount of staff
#---4. In the example below we are looking at the industry and how to add values to similar companies where the industry is blank or null 
#---5.We firstly SELECT everything where the industry is blank,we then UPDATE and SET it to null 
#---6. We then SELECT one company from the null to have as use case to know when a value has been added meaning null wont be displayed again
#---7. Then we use self join to differentiate similar company names that has values in them using JOIN statement
#---8.We then SELECT everything from the 2 self-join tables and use WHERE statement to display the null
#---9.Then we UPDATE the self join table and SET it to fill the nulls in both tables with the same value in similar tables
#---10.That is all and if you want to remove the row_number_effect column you just have to use  ALTER THE TABLE, then DROP the column
SELECT*
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL 
OR industry = '';


UPDATE layoffs_staging2
SET industry=NULL
WHERE industry=''
;


SELECT *
FROM layoffs_staging2
WHERE company='Airbnb';


SELECT *
FROM layoffs_staging2 AS A
JOIN layoffs_staging2 AS B
ON A.company=B.company
WHERE A.industry=B.industry IS NULL;


UPDATE layoffs_staging2 AS A
JOIN layoffs_staging2 AS B
ON A.company=B.company
SET A.industry=B.industry
WHERE A.industry IS NULL 
AND B.industry IS NOT NULL;

ALTER TABLE layoffs_staging2
DROP COLUMN row_number_effect;

SELECT *
FROM layoffs_staging2;







