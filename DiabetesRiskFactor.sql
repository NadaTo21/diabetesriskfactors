-- using group by gender with the aggragation funcation count to
--count the total of diabetic pepole in each group 
SELECT gender, count(*) as diabetic
FROM dbo.diabetes_prediction_dataset
WHERE diabetes = 1
group by gender

SELECT DISTINCT gender,count(*)
FROM dbo.diabetes_prediction_dataset
group by gender

-- updating smoking_history column by replacing the value "ever" to "never" and "not current" to "former
UPDATE dbo.diabetes_prediction_dataset
	SET smoking_history = CASE WHEN smoking_history ='ever' then 'never'
     WHEN smoking_history = 'current' then 'current'
	 WHEN smoking_history = 'former' then 'former'
	 WHEN smoking_history = 'not current' then 'former'
	 WHEN smoking_history = 'never' then 'never'
	 ELSE 'No Info' end

-- using group by smoking_history with the aggragation funcation count to
--count the total of diabetic pepole in each group 
SELECT smoking_history, count(*) as diabetic
FROM dbo.diabetes_prediction_dataset
WHERE diabetes = 1
group by smoking_history
ORDER BY smoking_history 
-- using group by smoking_history and gender with the aggragation funcation count to
--count the total of diabetic pepole in each group
SELECT smoking_history, gender, count(*) as diabetic
FROM dbo.diabetes_prediction_dataset
WHERE diabetes = 1
group by smoking_history, gender
ORDER BY smoking_history, gender
--creating a new column age_range
ALTER TABLE dbo.diabetes_prediction_dataset
ADD age_range nvarchar(255) ; 
-- determining age_range values using (case when)conditions
UPDATE  dbo.diabetes_prediction_dataset
SET age_range = CASE WHEN age BETWEEN 0.00 and 0.99 then 'Less than a year old'
	 WHEN age BETWEEN 1 and 18 then '1-18'
	 WHEN age BETWEEN 19 and 35 then '19-35'
	 WHEN age BETWEEN 36 and 52 then '36-52'
	 WHEN age BETWEEN 53 and 69 then '53-69'
	 ELSE '70 and above' end

-- using group by age_range with the aggragation funcation count to
--count the total of diabetic pepole in each group
SELECT age_range,   COUNT(*) as diabetic
FROM dbo.diabetes_prediction_dataset
WHERE diabetes = 1
group by  age_range
ORDER BY  age_range


-- using group by age_range and gender with the aggragation funcation count to
--count the total of diabetic pepole in each group

SELECT age_range, gender,  COUNT(*) as diabetic
FROM dbo.diabetes_prediction_dataset
WHERE diabetes = 1
group by  age_range, gender
ORDER BY  age_range, gender

--creating a new column bmi_range
ALTER TABLE dbo.diabetes_prediction_dataset
ADD bmi_range nvarchar(255) ;

-- determining bmi_range values using (case when)conditions
-- the range is decided according to https://www.cdc.gov/healthyweight/assessing/index.html

UPDATE  dbo.diabetes_prediction_dataset
SET bmi_range = CASE WHEN bmi < 18.5 then 'underweight '
	 WHEN bmi BETWEEN 18.5 and 24.9 then 'Healthy Weight '
	 WHEN bmi BETWEEN 25.0 and 29.9 then 'overweight'
	 ELSE 'obese' end



-- using group by bmi_range with the aggragation funcation count to
--count the number of diabetic pepole in each group

SELECT bmi_range, COUNT(*) as diabetic
FROM dbo.diabetes_prediction_dataset
WHERE diabetes = 1
group by  bmi_range
ORDER BY  bmi_range

-- using group by bmi_range and gender with the aggragation funcation count to
--count the number of diabetic pepole in each group

SELECT bmi_range,gender, COUNT(*) as diabetic
FROM dbo.diabetes_prediction_dataset
WHERE diabetes = 1
group by  bmi_range,gender
ORDER BY  bmi_range,gender

-- using group by hypertension  with the aggragation funcation count to
--count the number of diabetic pepole in each group

SELECT hypertension, COUNT(*) as positive
FROM dbo.diabetes_prediction_dataset
WHERE diabetes = 1
group by  hypertension
ORDER BY  hypertension

-- using group by heart_disease  with the aggragation funcation count to
--count the number of diabetic pepole in each group
SELECT heart_disease, COUNT(*) as positive
FROM dbo.diabetes_prediction_dataset
WHERE diabetes = 1
group by  heart_disease
ORDER BY  heart_disease

--SELECT blood_glucose_level_range, COUNT(*) as positive
--FROM dbo.diabetes_prediction_dataset
--WHERE diabetes = 1
--group by  blood_glucose_level_range
--ORDER BY  blood_glucose_level_range


--ALTER TABLE dbo.diabetes_prediction_dataset
--ADD blood_glucose_level_range nvarchar(255) ;

--UPDATE  dbo.diabetes_prediction_dataset
--SET blood_glucose_level_range = CASE WHEN blood_glucose_level <= 99 then '99 or less'
--	 WHEN blood_glucose_level BETWEEN 100 and 125 then 'between 100 and 125'
--	 ELSE 'more than 126' END
