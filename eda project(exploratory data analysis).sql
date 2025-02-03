SELECT *
FROM layoffs_staging2;
#---(Exploratory data analysis)

#--Company that sacked the most staff yearly

SELECT company,YEAR(`date`),total_laid_off
FROM layoffs_staging2
WHERE YEAR(`date`)IS NOT NULL
GROUP BY YEAR(`date`),company,total_laid_off
HAVING MAX(total_laid_off)
ORDER BY YEAR(`date`), total_laid_off DESC;

#--company that raised the most money

SELECT DISTINCT company, industry, funds_raised_millions
FROM layoffs_staging2
ORDER BY funds_raised_millions DESC;

#---funds raised by Netflix yearly and the amount of people sacked by date

SELECT company,(`date`),total_laid_off,funds_raised_millions
FROM layoffs_staging2
WHERE company LIKE'Netfli%';



#---Rolling total of people sacked each month every year 
SELECT SUBSTRING(`date`,1,7) AS MONTH_YEAR,SUM(total_laid_off) 
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7)IS NOT NULL
GROUP BY MONTH_YEAR
ORDER BY MONTH_YEAR;

WITH rolling_total AS
(SELECT SUBSTRING(`date`,1,7) AS MONTH_YEAR,SUM(total_laid_off) AS total_sum
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7)IS NOT NULL
GROUP BY MONTH_YEAR
ORDER BY MONTH_YEAR
)
SELECT MONTH_YEAR, total_sum,SUM(total_sum) OVER(ORDER BY MONTH_YEAR) AS rolling_total
FROM rolling_total;

#---Rolling total sum of funds generated each day by countries

SELECT DAY(`date`)AS `DAY`,MONTH(`date`) AS`MONTH`,YEAR(`date`) AS`YEAR`,country,SUM(funds_raised_millions)
FROM layoffs_staging2
GROUP BY DAY(`date`),MONTH(`date`),YEAR(`date`),country
ORDER BY `YEAR`, `MONTH`, `DAY`,country;

WITH rolling_total AS
(
SELECT DAY(`date`)AS `DAY`,MONTH(`date`) AS`MONTH`,YEAR(`date`) AS`YEAR`,country,SUM(funds_raised_millions) AS total_sum_per_day
FROM layoffs_staging2
GROUP BY DAY(`date`),MONTH(`date`),YEAR(`date`),country
ORDER BY `YEAR`, `MONTH`, `DAY`,country
)
SELECT`DAY`,`MONTH`,`YEAR`,country,total_sum_per_day,SUM(total_sum_per_day)OVER(ORDER BY `YEAR`, `MONTH`, `DAY`)
FROM rolling_total;

#---The top 5 total sum of staffs sacked in a company per year based on ranking

SELECT company,YEAR(`date`) AS `YEAR`,SUM(total_laid_off)AS SACKED_STAFFS
FROM layoffs_staging2
GROUP BY company,`YEAR`
ORDER BY `YEAR` DESC;

WITH rolling_total(COMPANY,`YEAR`, SACKED_STAFFS) AS
(SELECT company,YEAR(`date`) AS `YEAR`,SUM(total_laid_off)AS SACKED_STAFFS
FROM layoffs_staging2
GROUP BY company,`YEAR`
ORDER BY`YEAR` DESC
),
ranking_total AS
(
SELECT *,DENSE_RANK()OVER(PARTITION BY `YEAR`ORDER BY SACKED_STAFFS desc) AS RANKING
FROM rolling_total
WHERE `YEAR`IS NOT NULL
)
SELECT *
FROM ranking_total
WHERE RANKING<=5;
