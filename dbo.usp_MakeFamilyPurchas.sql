-- Создание процедуру
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,RyazantsevAI>
-- Create date: <Create Date, ,2023.07.02>
-- Description:	<Description, ,Процедура изменяет бюджет семьи после покупки>
-- =============================================
CREATE PROCEDURE dbo.usp_MakeFamilyPurchase 
	
	@FamilySurName varchar(255) = ''

AS
BEGIN
	
	SET NOCOUNT ON;

	IF(isnull(@FamilySurName, '') = (SELECT 
						SurName 
						FROM dbo.Family 
						WHERE SurName = @FamilySurName)) 
	
	BEGIN
		UPDATE dbo.Family
		SET BudgetValue = (SELECT 
			(F.BudgetValue - SUM(B.Value)) AS Remainder
		FROM dbo.Family AS F 
			INNER JOIN dbo.Basket AS B ON F.ID = B.ID_Family
		WHERE F.SurName = @FamilySurName
		GROUP BY 
			F.SurName
			,F.ID
			,F.BudgetValue)
		WHERE SurName = @FamilySurName
	END
	ELSE
	BEGIN
		PRINT 'Такой семьи нет'
		RETURN
	END

END
GO


--Запуск процедуры
--Необходимо ввести фамилию семьи, для которой требуется обновить данные бюджета
EXEC dbo.usp_MakeFamilyPurchase ' '   

