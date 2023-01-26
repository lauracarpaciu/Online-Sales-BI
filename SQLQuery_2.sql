-- SELECT TOP (1000) [EnglishProductName]
--       ,[year]
--       ,[qty]
--   FROM [AdventureWorksDW2020].[dbo].[vw_category_sales_volume]

-- SELECT 
--     EnglishProductName,
--     year,
--     qty,
--     FIRST_VALUE(EnglishProductName) OVER(
--         PARTITION BY year
--         ORDER BY qty
--     ) lowest_sales_volume
-- FROM 
--     dbo.vw_category_sales_volume
-- WHERE
--     year BETWEEN 2016 AND 2017;


-- SELECT 
--     EnglishProductName,
--     year,
--     qty,
--     LAST_VALUE(EnglishProductName) OVER(
-- 			PARTITION BY year
--         ORDER BY qty
--         RANGE BETWEEN 
--             UNBOUNDED PRECEDING AND 
--             UNBOUNDED FOLLOWING
--     ) highest_sales_volume
-- FROM 
--     dbo.vw_category_sales_volume
-- WHERE
--     year IN (2016,2017);


-- SELECT 
-- 	month,
-- 	EnglishProductName,
-- 	net_sales,
-- 	LEAD(net_sales,1) OVER (
-- 		PARTITION BY EnglishProductName
-- 		ORDER BY month
-- 	) next_month_sales
-- FROM 
-- 	dbo.vw_netsales_brands
-- WHERE
-- 	year = 2017;


-- SELECT 
-- 	month,
-- 	EnglishProductName,
-- 	net_sales,
-- 	LAG(net_sales,1) OVER (
-- 		PARTITION BY EnglishProductName
-- 		ORDER BY month
-- 	) previous_sales
-- FROM 
-- 	dbo.vw_netsales_brands
-- WHERE
-- 	year = 2017;

-- SELECT 
--    FirstName, 
--    LastName, 
--    EnglishOccupation,
--    ROW_NUMBER() OVER (
--       PARTITION BY EnglishOccupation
--       ORDER BY FirstName
--    ) row_num
-- FROM 
--    dbo.DimCustomer
-- ORDER BY 
--    EnglishOccupation;


-- SELECT * FROM (
-- 	SELECT
	    
-- 		PromotionKey,
--         ProductKey,
-- 		UnitPrice,
-- 		RANK () OVER ( 
-- 			PARTITION BY ProductKey
-- 			ORDER BY UnitPrice DESC
-- 		) price_rank 
-- 	FROM
-- 		dbo.FactInternetSales
-- ) t
-- WHERE price_rank <= 3;


-- SELECT
--     EnglishProductName,
--     CAST(ROUND(AVG(UnitPrice),2) AS DEC(10,2))
--     avg_product_price
-- FROM
--     dbo.FactInternetSales p
--     INNER JOIN dbo.DimProduct c ON c.ProductKey = p.ProductKey
-- GROUP BY
--     EnglishProductName
-- HAVING
--     AVG(UnitPrice) > 500
-- ORDER BY
--     avg_product_price;


-- SELECT
--     EnglishProductName,
--     SUM(OrderQuantity) total_stocks
-- FROM
--     dbo.FactInternetSales p
--     INNER JOIN dbo.DimProduct c ON c.ProductKey = p.ProductKey
-- GROUP BY
--     EnglishProductName
-- HAVING
--     SUM(OrderQuantity) > 100
-- ORDER BY
--     total_stocks DESC;


-- SELECT 
--     EnglishProductName,
--     COUNT(*) product_count
-- FROM
--     dbo.FactInternetSales p
--     INNER JOIN dbo.DimProduct c ON c.ProductKey = p.ProductKey
-- GROUP BY 
--     EnglishProductName
-- ORDER BY
--     product_count DESC;