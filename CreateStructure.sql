-- Создаем таблицу dbo.SKU
DROP TABLE IF EXISTS dbo.SKU;
CREATE TABLE dbo.SKU
(
    ID                                                int                  NOT NULL IDENTITY,
	Code AS ('s' + CAST(ID AS NVARCHAR(255))),
	Name                                              NVARCHAR(255)        NOT NULL,
    UNIQUE (Code),
	CONSTRAINT PK_SKU PRIMARY KEY(ID)
);

-- Создаем таблицу dbo.Family
DROP TABLE IF EXISTS dbo.Family;
CREATE TABLE dbo.Family
(
    ID                    INT                  NOT NULL IDENTITY,
	SurName               NVARCHAR(255)        NOT NULL,
    BudgetValue           INT                  NOT NULL,
);

-- Создаем таблицу dbo.Basket
DROP TABLE IF EXISTS dbo.Basket;
CREATE TABLE dbo.Basket
(
    ID                    INT                  NOT NULL IDENTITY,
	ID_SKU                INT                  NOT NULL,
	ID_Family             INT                  NOT NULL,
	Quantity              INT                  NOT NULL,
	Value                 INT                  NOT NULL,
	PurchaseDate          DATETIME             NOT NULL DEFAULT CURRENT_TIMESTAMP, 
	DiscountValue         INT                  NOT NULL DEFAULT 0
	CONSTRAINT PK_Basket PRIMARY KEY(ID),
	CONSTRAINT FK_Basket_SKU FOREIGN KEY(ID_SKU)
    REFERENCES dbo.SKU(ID),
	CONSTRAINT FK_Basket_Family FOREIGN KEY(ID_Family)
    REFERENCES dbo.Family(ID),
	CONSTRAINT CHK_Quantity  CHECK (Quantity >= 0),
	CONSTRAINT CHK_Value  CHECK (Value >= 0)
);