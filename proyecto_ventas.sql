USE BaseDatosReckitt
------------------------------
SELECT * FROM INFORMATION_SCHEMA.TABLES;
------------------------------------------
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FACT_SALES';
--------------------------------------
SELECT 
    ITEM_CODE,
    SUM([TOTAL_VALUE_SALES]) AS total_ventas
FROM FACT_SALES
GROUP BY ITEM_CODE
ORDER BY total_ventas DESC;
--------------------------------
SELECT 
    REGION,
    SUM([TOTAL_VALUE_SALES]) AS total_ventas
FROM FACT_SALES
GROUP BY REGION
ORDER BY total_ventas DESC;
------------------------------
SELECT 
    WEEK,
    SUM([TOTAL_VALUE_SALES]) AS total_ventas
FROM FACT_SALES
GROUP BY WEEK
ORDER BY WEEK;
-----------------
SELECT 
    p.ITEM,
    SUM(f.[TOTAL_VALUE_SALES]) AS total_ventas
FROM FACT_SALES f
JOIN DIM_PRODUCT p ON f.ITEM_CODE = p.ITEM
GROUP BY p.ITEM
ORDER BY total_ventas DESC;