# Шаги воспроизведения
1. В ветке "Tables" расположен файл "CreateStructure.sql", в котором создаются таблицы : "dbo.SKU", "dbo.Family", "dbo.Basket"
1. В ветке "Functions" расположен файл "dbo.udf_GetSKUPrice.sql", в котором создается функция рассчитывающая стоимость передаваемого продукта  из таблицы "dbo.Basket"
1. В ветке "VIEWs" расположен файл "dbo.vw_SKUPrice.sql", в котором создаюется представление таблицы "dbo.SKU"
1. В ветке "Procedures" расположен файл "dbo.usp_MakeFamilyPurchas.sql", в котором создается процедура обновляющаяя данные в таблице "dbo.Family" в поле "DiscountValue"
1. В ветке "Triggers" расположен файл "dbo.TR_Basket_insert_update", в котором создается триггер рассчитывающий скидку для "ID_SKU", если добавляется 2 и более записей для данного "ID_SKU"
