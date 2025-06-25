USE AdventureWorks2019

-- 1. Resumen de empleados por departamento :Se solicita la información del total
   -- de empleados que tiene cada departamento, debe contener los siguientes campos
   -- a. Nombre de departamento
   -- b. Número de empleados que posee

   	   SELECT * FROM HumanResources.Department
	   SELECT * FROM HumanResources.EmployeeDepartmentHistory


   SELECT 
		d.name AS NombreDepartamento,
		count(*) AS NumeroTotalEmpleados

		FROM HumanResources.EmployeeDepartmentHistory edh
		JOIN HumanResources.Department d
		ON d.DepartmentID = edh.BusinessEntityID
		WHERE EndDate IS NULL
		GROUP BY d.Name
		ORDER BY count(*) desc
		  

--2. Resumen de ventas por territorio: Se necesita mostrar el total de 
  --  ventas por territorio, los campos que se deben mostrar son:
  --  a. Nombre Territorio
  --  b. TotalVentasTerritorio

	   SELECT * FROM Sales.SalesOrderHeader
	   SELECT * FROM Sales.SalesTerritory


		SELECT 
		st.Name AS NombreTerritorio,
		(soh.SubTotal + (soh.Subtotal * 0.15)) AS TotalVentasTerritorio

		FROM Sales.SalesOrderHeader soh
		JOIN Sales.SalesTerritory st
		ON st.TerritoryID = soh.ShipToAddressID


--3. Resumen de ventas por territorio y año: Se necesita mostrar el total de 
-- ventas por territorio y año, los campos que se deben mostrar son:
  --  a. Nombre Territorio
  --  b. Año
  --  c. TotalVentasTerritorio
		

	   SELECT * FROM Sales.SalesOrderHeader
	   SELECT * FROM Sales.SalesTerritory


		SELECT 
		st.Name AS NombreTerritorio,
		YEAR(soh.OrderDate) Anio,
		(soh.SubTotal + (soh.Subtotal * 0.15)) AS TotalVentasTerritorio
		FROM Sales.SalesOrderHeader soh
		JOIN Sales.SalesTerritory st
		ON st.TerritoryID = soh.ShipToAddressID


--4. Información general de personas:
   --  Mostrar los datos de la persona, los campos requeridos son
   --  a. NombreCompletoPersona
   --  b. TelefonoCelular
   --  c. DireccionHogar


   	   SELECT * FROM Person.Person
	   SELECT * FROM Person.PersonPhone
	   SELECT * FROM Person.Address


		SELECT 
			 (p.FirstName + ' ' + ISNULL (p.MiddleName, '') + '' + p.LastName) AS NombreCompletoPersona,
		     pp.PhoneNumber AS TelefonoCelular,
			 a.AddressLine1 AS DireccionHogar
		
		FROM Person.Person p
		JOIN Person.PersonPhone pp
		ON pp.BusinessEntityID = p.BusinessEntityID
		JOIN Person.Address a
		ON a.AddressID = p.BusinessEntityID