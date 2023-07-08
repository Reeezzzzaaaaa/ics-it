--Создание фунции
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,RyazantsevAI>
-- Create date: <Create Date, ,2023.07.01>
-- Description:	<Description, ,Функция рассчитывает стоимость передаваемого продукта из таблицы dbo.Basket>
-- =============================================
CREATE FUNCTION udf_GetSKUPrice 
(
    @ID_SKU INT
)
RETURNS DECIMAL(18, 2)
AS
BEGIN
	DECLARE @UnitPrice DECIMAL(18, 2)
	
	SELECT @UnitPrice = SUM(Value)/SUM(Quantity)
	FROM dbo.Basket
	WHERE ID_SKU = @ID_SKU
	GROUP BY ID_SKU

	RETURN @UnitPrice

END
GO




--Запуск функции
DECLARE @ID_SKU INT
--Необходимо ввести ID_SKU, для которого требуется рассчитать стоимость передаваемого продукта
set @ID_SKU = " "

SELECT CAST(SUM(Value)/SUM(Quantity) AS DECIMAL(18, 2)) AS UnitPrice
FROM dbo.Basket
WHERE ID_SKU = @ID_SKU
GROUP BY ID_SKU