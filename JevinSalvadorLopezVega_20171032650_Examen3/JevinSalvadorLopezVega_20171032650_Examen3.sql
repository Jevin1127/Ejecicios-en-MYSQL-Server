USE AdventureWorks2019

--1. (15%) Se necesita saber el resumen de la cantidad de ofertas que se posee cada producto, la
--información mostrada debe ser ordenada de A-Z de acuerdo con el nombre del producto.

		SELECT * FROM Production.Product
		SELECT * FROM Sales.SpecialOffer
		SELECT * FROM Sales.SpecialOfferProduct

		SELECT 
	          p.Name AS NombreProducto,
			  count(sop.specialofferID) AS CantidadOfertas

	          FROM Production.Product p
			  INNER JOIN Sales.SpecialOfferProduct sop
			  ON sop.ProductID = p.ProductID
			  GROUP BY p.Name
			  ORDER by p.name asc


-- 2. (10%) Listar las órdenes cuyo número de cuenta contenga 4020 y que el mes de la orden sea mayo, los campos que debe mostrar son:
-- 1. Mes de la orden
-- 2. Dia de la Orden
-- 3. Año de la orden
-- 4. Total (la fórmula para calcularlo es: Subtotal x 12% + Subtotal)
--5. El nombre completo del vendedor: Los nombres están en la tabla Person considere el campo SalesPersonID. 
-- Se deben manejar los casos que no tenga middleName al momento de concatenar no muestre null.

		SELECT * FROM Person.Person
		SELECT * FROM Sales.SalesOrderHeader

			 SELECT 
	          MONTH(soh.OrderDate) AS Mes,
			  DAY(soh.OrderDate) AS Dia,
			  YEAR(soh.OrderDate) AS Anio,
			  (soh.SubTotal + (soh.SubTotal * 0.12)) AS Total,
			  (p.FirstName + ' ' + ISNULL (p.MiddleName, '') + '' + p.LastName) AS NombreCompleto
	  
	          FROM Sales.SalesOrderHeader soh 
			  LEFT JOIN Person.Person p
			  ON p.BusinessEntityID = soh.SalesPersonID
			  WHERE soh.AccountNumber LIKE '%4020%' AND Datepart(mm,soh.OrderDate) = 5 
