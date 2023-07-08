--Создание триггера
CREATE TRIGGER dbo.TR_Basket_insert_update
	ON dbo.Basket
	INSTEAD OF INSERT
	AS
BEGIN
	DECLARE @idSKUCount int
	SET @idSKUCount = (SELECT COUNT(ID_SKU) FROM INSERTED)

	BEGIN
	IF @idSKUCount >= 2

		BEGIN
			INSERT INTO dbo.Basket
				(ID_SKU
				,ID_Family
				,Quantity
				,Value
				,DiscountValue)
			SELECT 
				ID_SKU
				,ID_Family
				,Quantity
				,Value
				,(Value * 0.05) 
			FROM INSERTED
		END
	ELSE 
		BEGIN
			INSERT INTO dbo.Basket
				(ID_SKU
				,ID_Family
				,Quantity
				,Value
				,DiscountValue)
			SELECT 
				ID_SKU
				,ID_Family
				,Quantity
				,Value
				,0 
			FROM INSERTED
		END
	END
END
