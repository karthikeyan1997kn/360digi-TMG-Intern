SELECT * FROM medical_data.medical_data;

USE medical_data;

SELECT * FROM medical_data;

SELECT *
FROM medical_data
WHERE
    Typeofsales IS NULL OR
    Patient_ID IS NULL OR
    Specialisation IS NULL OR
    Dept IS NULL OR
    Dateofbill IS NULL OR
    Quantity IS NULL OR
    ReturnQuantity IS NULL OR
    Final_Cost IS NULL OR
    Final_Sales IS NULL OR
    RtnMRP IS NULL OR
    Formulation IS NULL OR
    DrugName IS NULL OR
    SubCat IS NULL OR
    SubCat1 IS NULL;
    
SELECT * FROM medical_data; 

UPDATE medical_data
SET
    Typeofsales = NULLIF(Typeofsales, ''),
    Patient_ID = NULLIF(Patient_ID, ''),
    Specialisation = NULLIF(Specialisation, ''),
    Dept = NULLIF(Dept, ''),
    Dateofbill = NULLIF(Dateofbill, ''),
    Quantity = NULLIF(Quantity, ''),
    ReturnQuantity = NULLIF(ReturnQuantity, ''),
    Final_Cost = NULLIF(Final_Cost, ''),
    Final_Sales = NULLIF(Final_Sales, ''),
    RtnMRP = NULLIF(RtnMRP, ''),
    Formulation = NULLIF(Formulation, ''),
    DrugName = NULLIF(DrugName, ''),
    SubCat = NULLIF(SubCat, ''),
    SubCat1 = NULLIF(SubCat1, '');
    
    SELECT * FROM medical_data; 
    
    SELECT COUNT(*) - COUNT(Typeofsales) AS Typeofsales_null_count,
       COUNT(*) - COUNT(Patient_ID) AS Patient_ID_null_count,
       COUNT(*) - COUNT(Specialisation) AS Specialisation_null_count,
       COUNT(*) - COUNT(Dept) AS Dept_null_count,
       COUNT(*) - COUNT(Dateofbill) AS Dateofbill_null_count,
       COUNT(*) - COUNT(Quantity) AS Quantity_null_count,
       COUNT(*) - COUNT(ReturnQuantity) AS ReturnQuantity_null_count,
       COUNT(*) - COUNT(Final_Cost) AS Final_Cost_null_count,
       COUNT(*) - COUNT(Final_Sales) AS Final_Sales_null_count,
       COUNT(*) - COUNT(RtnMRP) AS RtnMRP_null_count,
       COUNT(*) - COUNT(Formulation) AS Formulation_null_count,
       COUNT(*) - COUNT(DrugName) AS DrugName_null_count,
       COUNT(*) - COUNT(SubCat) AS SubCat_null_count,
       COUNT(*) - COUNT(SubCat1) AS SubCat1_null_count
FROM medical_data;

 SELECT * FROM medical_data;
 
 SELECT *
FROM medical_data
GROUP BY Typeofsales, Patient_ID, Specialisation, Dept, Dateofbill, Quantity, ReturnQuantity, Final_Cost, Final_Sales, RtnMRP, Formulation, DrugName, SubCat, SubCat1
HAVING COUNT(*) > 1;

 SELECT * FROM medical_data;
 
 SELECT Patient_ID, COUNT(*) AS count
FROM medical_data
GROUP BY Patient_ID
HAVING COUNT(*) > 1;

 SELECT * FROM medical_data;
 
 -- Convert the "Dateofbill" column from text to date
UPDATE medical_data
SET Dateofbill = STR_TO_DATE(Dateofbill, '%m/%d/%Y');

 SELECT * FROM medical_data;
 
 SELECT
  COUNT(*) AS total_rows,
  AVG(Quantity) AS avg_quantity,
  MIN(Final_Cost) AS min_cost,
  MAX(Final_Sales) AS max_sales
FROM medical_data;

# 14218	 2.5310	40	39490



SELECT
  SUM(CASE WHEN Quantity < 5 THEN 1 ELSE 0 END) AS qty_lt_5,
  SUM(CASE WHEN Quantity >= 5 AND Quantity < 10 THEN 1 ELSE 0 END) AS qty_between_5_and_10,
  SUM(CASE WHEN Quantity >= 10 THEN 1 ELSE 0 END) AS qty_ge_10
FROM medical_data;

# 11400	714	423

SELECT
  COUNT(*) - COUNT(Typeofsales) AS missing_Typeofsales,
  COUNT(*) - COUNT(Patient_ID) AS missing_Patient_ID,
  COUNT(*) - COUNT(Specialisation) AS missing_Specialisation,
  COUNT(*) - COUNT(Dept) AS missing_Dept,
  COUNT(*) - COUNT(Dateofbill) AS missing_Dateofbill,
  COUNT(*) - COUNT(Quantity) AS missing_Quantity,
  COUNT(*) - COUNT(ReturnQuantity) AS missing_ReturnQuantity,
  COUNT(*) - COUNT(Final_Cost) AS missing_Final_Cost,
  COUNT(*) - COUNT(Final_Sales) AS missing_Final_Sales,
  COUNT(*) - COUNT(RtnMRP) AS missing_RtnMRP,
  COUNT(*) - COUNT(Formulation) AS missing_Formulation,
  COUNT(*) - COUNT(DrugName) AS missing_DrugName,
  COUNT(*) - COUNT(SubCat) AS missing_SubCat,
  COUNT(*) - COUNT(SubCat1) AS missing_SubCat1
FROM medical_data;

SELECT *
FROM medical_data
WHERE Quantity <= (SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY Quantity) FROM medical_data);

SELECT *
FROM medical_data
WHERE Quantity <= (SELECT
                      MAX(Quantity)
                   FROM
                      (SELECT Quantity
                       FROM medical_data
                       ORDER BY Quantity
                       LIMIT (SELECT CEIL(0.95 * COUNT(*)) FROM medical_data)));
                       
SELECT *
FROM medical_data
WHERE Quantity <= (
  SELECT
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY Quantity) OVER () AS percentile
  FROM medical_data
);


-- Specialisation
SELECT Specialisation, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY Specialisation;

-- Repeat the above for other columns:
-- Typeofsales
SELECT Typeofsales, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY Typeofsales;

-- Patient_ID
SELECT Patient_ID, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY Patient_ID;

-- And so on for each column...

SELECT Dept, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY Dept;

SELECT Dateofbill, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY Dateofbill;

SELECT Quantity, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY Quantity;

SELECT ReturnQuantity, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY ReturnQuantity;

SELECT Final_Cost, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY Final_Cost;

SELECT Final_Sales, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY Final_Sales;

SELECT RtnMRP, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY RtnMRP;

SELECT Formulation, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY Formulation;

SELECT DrugName, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY DrugName;

SELECT SubCat, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY SubCat;

SELECT SubCat1, COUNT(*) AS count, COUNT(*) / (SELECT COUNT(*) FROM medical_data) AS percentage
FROM medical_data
GROUP BY SubCat1;

SELECT COUNT(*) AS total_records FROM medical_data;

SELECT COUNT(DISTINCT Typeofsales) AS unique_typeofsales_count FROM medical_data;

SELECT Specialisation, COUNT(*) AS count
FROM medical_data
GROUP BY Specialisation
ORDER BY count DESC
LIMIT 1;

SELECT COUNT(DISTINCT Dept) AS unique_dept_count FROM medical_data;

SELECT MIN(Dateofbill) AS earliest_date FROM medical_data;

SELECT MAX(Dateofbill) AS latest_date FROM medical_data;

SELECT AVG(Quantity) AS average_quantity FROM medical_data;

SELECT SUM(Final_Cost) AS total_final_cost FROM medical_data;

SELECT SUM(Final_Sales) AS total_final_sales FROM medical_data;

SELECT COUNT(*) AS return_transactions_count
FROM medical_data
WHERE ReturnQuantity > 0;

SELECT MAX(RtnMRP) AS highest_rtnmrp FROM medical_data;

SELECT Formulation, COUNT(*) AS count
FROM medical_data
GROUP BY Formulation
ORDER BY count DESC
LIMIT 1;

SELECT AVG(Final_Sales) AS avg_final_sales_dept1
FROM medical_data
WHERE Dept = 'Department1';

SELECT COUNT(*) AS iv_fluids_transactions
FROM medical_data
WHERE SubCat1 = 'IV FLUIDS, ELECTROLYTES, TPN';

SELECT SUM(RtnMRP) AS total_rtnmrp_for_returns
FROM medical_data
WHERE ReturnQuantity > 0;

SELECT COUNT(*) AS transactions_in_2022
FROM medical_data
WHERE YEAR(Dateofbill) = 2022;

SELECT MAX(Final_Sales) AS max_final_sales FROM medical_data;

SELECT COUNT(DISTINCT SubCat) AS unique_subcat_count FROM medical_data;

SELECT SUM(Final_Cost) AS total_final_cost_anti_infectives
FROM medical_data
WHERE SubCat = 'ANTI-INFECTIVES';

-- Mean (Average) for each numerical column
SELECT
  AVG(Quantity) AS Mean_Quantity,
  AVG(ReturnQuantity) AS Mean_ReturnQuantity,
  AVG(Final_Cost) AS Mean_Final_Cost,
  AVG(Final_Sales) AS Mean_Final_Sales,
  AVG(RtnMRP) AS Mean_RtnMRP
FROM medical_data;

-- Median for each numerical column
WITH OrderedData AS (
  SELECT
    Quantity,
    ReturnQuantity,
    Final_Cost,
    Final_Sales,
    RtnMRP,
    ROW_NUMBER() OVER (ORDER BY Quantity) AS QuantityRank,
    ROW_NUMBER() OVER (ORDER BY ReturnQuantity) AS ReturnQuantityRank,
    ROW_NUMBER() OVER (ORDER BY Final_Cost) AS FinalCostRank,
    ROW_NUMBER() OVER (ORDER BY Final_Sales) AS FinalSalesRank,
    ROW_NUMBER() OVER (ORDER BY RtnMRP) AS RtnMRPRank
  FROM medical_data
)
SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Quantity) AS Median_Quantity,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ReturnQuantity) AS Median_ReturnQuantity,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Final_Cost) AS Median_Final_Cost,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Final_Sales) AS Median_Final_Sales,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY RtnMRP) AS Median_RtnMRP
FROM OrderedData
WHERE QuantityRank = (SELECT COUNT(*) / 2 FROM medical_data)
  OR ReturnQuantityRank = (SELECT COUNT(*) / 2 FROM medical_data)
  OR FinalCostRank = (SELECT COUNT(*) / 2 FROM medical_data)
  OR FinalSalesRank = (SELECT COUNT(*) / 2 FROM medical_data)
  OR RtnMRPRank = (SELECT COUNT(*) / 2 FROM medical_data);



-- Mode for each numerical column
WITH ModeData AS (
  SELECT
    Quantity,
    ReturnQuantity,
    Final_Cost,
    Final_Sales,
    RtnMRP,
    ROW_NUMBER() OVER (PARTITION BY Quantity ORDER BY Quantity) AS QuantityRank,
    ROW_NUMBER() OVER (PARTITION BY ReturnQuantity ORDER BY ReturnQuantity) AS ReturnQuantityRank,
    ROW_NUMBER() OVER (PARTITION BY Final_Cost ORDER BY Final_Cost) AS FinalCostRank,
    ROW_NUMBER() OVER (PARTITION BY Final_Sales ORDER BY Final_Sales) AS FinalSalesRank,
    ROW_NUMBER() OVER (PARTITION BY RtnMRP ORDER BY RtnMRP) AS RtnMRPRank
  FROM medical_data
)
SELECT
  Quantity AS Mode_Quantity,
  ReturnQuantity AS Mode_ReturnQuantity,
  Final_Cost AS Mode_Final_Cost,
  Final_Sales AS Mode_Final_Sales,
  RtnMRP AS Mode_RtnMRP
FROM ModeData
WHERE QuantityRank = 1
  OR ReturnQuantityRank = 1
  OR FinalCostRank = 1
  OR FinalSalesRank = 1
  OR RtnMRPRank = 1;
  
  -- Identify Features, Categorical Columns, and Continuous Columns
SELECT
  COLUMN_NAME AS Feature,
  CASE
    WHEN DATA_TYPE = 'VARCHAR' THEN 'Categorical'
    WHEN DATA_TYPE = 'DATE' THEN 'Categorical'
    ELSE 'Continuous'
  END AS Column_Type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'medical_data';


-- List data types of columns in the "medical_data" table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'medical_data';


SELECT
  'Typeofsales' AS Column,
  COUNT(DISTINCT Typeofsales) AS Unique_Values
FROM medical_data
UNION ALL
SELECT
  'Specialisation' AS Column,
  COUNT(DISTINCT Specialisation) AS Unique_Values
FROM medical_data
UNION ALL
SELECT
  'Dept' AS Column,
  COUNT(DISTINCT Dept) AS Unique_Values
FROM medical_data
UNION ALL
SELECT
  'Formulation' AS Column,
  COUNT(DISTINCT Formulation) AS Unique_Values
FROM medical_data
UNION ALL
SELECT
  'DrugName' AS Column,
  COUNT(DISTINCT DrugName) AS Unique_Values
FROM medical_data
UNION ALL
SELECT
  'SubCat' AS Column,
  COUNT(DISTINCT SubCat) AS Unique_Values
FROM medical_data
UNION ALL
SELECT
  'SubCat1' AS Column,
  COUNT(DISTINCT SubCat1) AS Unique_Values
FROM medical_data;


SELECT
  'Patient_ID' AS column,
  AVG(Patient_ID) AS Mean,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Patient_ID) AS Median,
  MIN(Patient_ID) AS Min,
  MAX(Patient_ID) AS Max,
  STDDEV(Patient_ID) AS StdDev
FROM medical_data
UNION ALL
SELECT
  'Dateofbill' AS Column,
  NULL AS Mean,
  NULL AS Median,
  MIN(Dateofbill) AS Min,
  MAX(Dateofbill) AS Max,
  NULL AS StdDev
FROM medical_data
UNION ALL
SELECT
  'Quantity' AS Column,
  AVG(Quantity) AS Mean,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Quantity) AS Median,
  MIN(Quantity) AS Min,
  MAX(Quantity) AS Max,
  STDDEV(Quantity) AS StdDev
FROM medical_data
UNION ALL
SELECT
  'ReturnQuantity' AS Column,
  AVG(ReturnQuantity) AS Mean,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ReturnQuantity) AS Median,
  MIN(ReturnQuantity) AS Min,
  MAX(ReturnQuantity) AS Max,
  STDDEV(ReturnQuantity) AS StdDev
FROM medical_data
UNION ALL
SELECT
  'Final_Cost' AS Column,
  AVG(Final_Cost) AS Mean,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Final_Cost) AS Median,
  MIN(Final_Cost) AS Min,
  MAX(Final_Cost) AS Max,
  STDDEV(Final_Cost) AS StdDev
FROM medical_data
UNION ALL
SELECT
  'Final_Sales' AS Column,
  AVG(Final_Sales) AS Mean,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Final_Sales) AS Median,
  MIN(Final_Sales) AS Min,
  MAX(Final_Sales) AS Max,
  STDDEV(Final_Sales) AS StdDev
FROM medical_data
UNION ALL
SELECT
  'RtnMRP' AS Column,
  AVG(RtnMRP) AS Mean,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY RtnMRP) AS Median,
  MIN(RtnMRP) AS Min,
  MAX(RtnMRP) AS Max,
  STDDEV(RtnMRP) AS StdDev
FROM medical_data;































