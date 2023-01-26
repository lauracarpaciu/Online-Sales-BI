-- CREATE VIEW 
--     dbo.vw_category_sales_volume 
-- AS
-- SELECT 
--     EnglishProductName, 
--     YEAR(FullDateAlternateKey) year, 
--     SUM(OrderQuantity) qty
-- FROM 
--  dbo.FactInternetSales f
--  INNER JOIN
--  dbo.DimDate d ON f.DueDateKey=d.DateKey
--   INNER JOIN dbo.DimProduct p ON f.ProductKey = p.ProductKey
-- GROUP BY 
--     EnglishProductName, 
--     YEAR(FullDateAlternateKey);



-- CREATE VIEW dbo.vw_netsales_brands
-- AS
-- SELECT 
-- 		EnglishProductName, 
-- 		MONTH(FullDateAlternateKey) month, 
-- 		YEAR(FullDateAlternateKey) year, 
-- 		CONVERT(DEC(10, 0), SUM((UnitPrice * OrderQuantity) * (1 - DiscountAmount))) AS net_sales

-- FROM 
--  dbo.FactInternetSales f
--  INNER JOIN
--  dbo.DimDate d ON f.DueDateKey=d.DateKey
--  INNER JOIN dbo.DimProduct p ON f.ProductKey = p.ProductKey
-- GROUP BY EnglishProductName, 
-- MONTH(FullDateAlternateKey), 
-- YEAR(FullDateAlternateKey);    