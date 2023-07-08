--Создание представления
GO
CREATE VIEW dbo.vw_SKUPrice
AS

SELECT 
	S.ID
	,S.Code
	,S.Name
	,dbo.udf_GetSKUPrice(B.ID_SKU) AS UnitPrice
FROM dbo.SKU AS S 
	INNER JOIN dbo.Basket AS B ON S.ID = B.ID_SKU
GROUP BY 
	B.ID_SKU
	,S.ID
	,S.Code
	,S.Name





--Запуск представления
SELECT TOP (1000) [ID]
      ,[Code]
      ,[Name]
      ,[UnitPrice]
  FROM [master].[dbo].[vw_SKUPrice]





