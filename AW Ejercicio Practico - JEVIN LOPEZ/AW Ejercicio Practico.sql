USE AdventureWorks2019

--1. Mostrar el listado de los empleados
--. Nombre
--a. Sueldo
--b. Descripción departamento
--c. Vacaciones
--d. Fecha Nacimiento
--e. Fecha Contratación
--f. Estado Civil
--g. Género
--h. Edad
--i. Antigüedad Laboral en años.

	   SELECT * FROM HumanResources.Employee
	   SELECT * FROM HumanResources.EmployeePayHistory
	   SELECT * FROM Person.Person

	   SELECT 
	         (p.FirstName + ' ' + ISNULL (p.MiddleName, '') + '' + p.LastName) AS NombreCompleto,
			  (h.Rate * h.PayFrequency) AS Sueldo,
	          e.JobTitle AS DescripcionDepartamento ,e.VacationHours AS Vacaciones,
			  e.BirthDate AS FechaNacimiento,e.HireDate AS FechaContratacion,
			  e.MaritalStatus AS EstadoCivil,
			  e.Gender AS Genero,
			  DATEDIFF(YEAR,e.BirthDate,GETDATE()) AS Edad ,
	          DATEDIFF(YEAR,e.HireDate,GETDATE()) AntiguedadLaboralEnAños

	          FROM HumanResources.Employee e 
			  INNER JOIN Person.Person p
			  ON e.BusinessEntityID = p.BusinessEntityID
			  INNER JOIN HumanResources.EmployeePayHistory h
			  ON e.BusinessEntityID = h.BusinessEntityID

--2. Mostrar las direcciones de los empleados
	-- a. Nombre del empleado
    -- b. Descripcion tipo de dirección
    -- c. Direccion

	   SELECT * FROM Person.Person
	   SELECT * FROM Person.Address
	   SELECT * FROM Person.AddressType

	
	   	   SELECT 
	          (p.FirstName + ' ' + ISNULL (p.MiddleName, '') + '' + p.LastName) AS NombreEmpleado,
			  at.Name AS DescripcionDireccion,
			  a.AddressLine1 AS Direccion

	          FROM Person.Person p
			  JOIN Person.Address a
			  ON p.BusinessEntityID = a.AddressID
			  JOIN Person.AddressType at
			  ON p.BusinessEntityID = at.AddressTypeID


--3. Mostrar las ordenes
  -- 1. Número de Orden
  -- 2. Fecha de la orden
  -- 3. Fecha de Envío
  -- 4. Fecha Vencimiento
  -- 5. Direccion de Envio (La descripción)
  -- 6. Subtotal
  -- 7. Calcular el 15% del subtotal
  -- 8. Calcular el tota que es El subtotal más el 15% del subtotal.
  -- 9. Id Territorio
  -- 10. Descripcion del territorio

		SELECT * FROM Sales.SalesOrderHeader
		SELECT * FROM Person.Address
		SELECT * FROM Sales.SalesTerritory
		
			 SELECT 
			  soh.SalesOrderNumber AS NumeroOrden,
			  soh.OrderDate AS FechaOrden,
			  soh.DueDate AS FechaEnvio,
			  soh.ShipDate AS FechaVencimiento,
			  a.AddressLine1 AS DireccionEnvio,
			  soh.Subtotal,
			  (soh.SubTotal * 0.15) AS Impuesto,
			  (soh.Subtotal + (soh.SubTotal * 0.15)) AS Total,
			  soh.TerritoryID AS IDTerritorio,
			  st.Name AS DescripcionTerritorio

	          FROM Sales.SalesOrderHeader soh
			  JOIN Person.Address a
			  ON a.AddressID = soh.ShipToAddressID
			  JOIN Sales.SalesTerritory st
			  ON  st.TerritoryID  = soh.ShipToAddressID
			  

-- 4. Listar el detalle de las siguientes ordenes 43659,43660,43661
   -- a. CarrierTrackingNumber
   -- b. Descripcion del producto
   -- c. Cantidad
   -- d. Precio Unitario
   -- e. Impuesto : 15% del precio unitario
   -- f. Precio Total : Para el precio total debe considerar la cantidad el impuesto y el precio unitario.
   
		SELECT * FROM Sales.SalesOrderHeader
		SELECT * FROM Sales.SalesOrderDetail
		SELECT * FROM Sales.Store

			 SELECT 
	          sod.CarrierTrackingNumber AS CarrierTrackingNumber,
			  ss.Name AS DescripcionProducto,
			  sod.OrderQty AS Cantidad,
			  sod.UnitPrice AS PrecioUnitario,
			  (sod.UnitPrice * 0.15) AS Impuesto,
			  (sod.UnitPrice + (sod.UnitPrice * 0.15)) AS PrecioTotal
			  
	          FROM Sales.SalesOrderHeader soh 
			  LEFT JOIN Sales.SalesOrderDetail sod
			  ON sod.SalesOrderDetailID = soh.ShipToAddressID
			  LEFT JOIN Sales.Store ss
			  ON  ss.BusinessEntityID  = soh.ShipToAddressID
			  WHERE soh.SalesOrderID IN (43659,43660,43661)

			  
-- 5. Mostrar todas las ordenes realizadas del 1 de enero del 2005 al 31 de enero del 2005.
  -- a. Número de orden
  -- b. Número de cuenta
  -- c. CustomerId
  -- d. BillToAddressID
  -- e. Dirección donde llega la factura(BillToAddress)

		   
		SELECT * FROM Sales.SalesOrderHeader
		SELECT * FROM Person.Address


			 SELECT 
			  soh.SalesOrderID AS NumeroOrden , 
			  soh.AccountNumber AS NumeroCuenta,
			  soh.CustomerID AS CustomerId,
			  soh.BillToAddressID AS BillToAddressID,
			  a.AddressLine1 AS DireccionFinalFactura
			  
	          FROM Sales.SalesOrderHeader soh 
			  JOIN Person.Address a
			  ON a.AddressID  = soh.ShipToAddressID

			  WHERE soh.OrderDate BETWEEN '2012-01-01' AND '2012-01-31'
                                                                  -- Coloqué del 2012 ya que en los datos no hay fechas guardadas del 2005

--6. Listar las órdenes del territorio 5 y 3 ordenadas por la fecha 
--de envío desde las más antigua a la más reciente y por el territorio
--del menor a mayor

		SELECT * FROM Sales.SalesTerritory
		SELECT * FROM Sales.SalesTerritoryHistory


			 SELECT 
			    sth.StartDate

			  FROM Sales.SalesTerritory st
			  LEFT JOIN Sales.SalesTerritoryHistory sth
			  ON sth.BusinessEntityID  = st.TerritoryID
			  WHERE st.TerritoryID IN (5,3)
			  ORDER BY sth.StartDate DESC
                             --Necesito saber por que me aparecen NULL 
	
	
--7. Listar las órdenes cuyo número de cuenta contenga 4030.

		SELECT * FROM Sales.SalesOrderHeader

			 SELECT  *
	          FROM Sales.SalesOrderHeader soh  
			  WHERE soh.AccountNumber LIKE '%4030%' 
			  ORDER BY soh.AccountNumber DESC


-- 8. Listar el detalle de la orden de la siguiente cuenta(AccountNumbre) 10-4030-019357
		
		SELECT * FROM Sales.SalesOrderHeader

			 SELECT  *
	          FROM Sales.SalesOrderHeader soh  
			  WHERE soh.AccountNumber IN ('10-4030-019357')


-- 9. Listar el inventario de productos :
  -- 1. Cantidad
  -- 2. LocationID
  -- 3. Descripcion de la ubicacion

		SELECT * FROM Production.ProductInventory
		SELECT * FROM Production.Location
		

			 SELECT 
			  ppi.Quantity AS Cantidad,
			  ppi.LocationID AS IDLocalicacion , 
			  pl.Name AS DescripcionLocacion
	  
	          FROM Production.ProductInventory ppi
			  JOIN Production.Location pl
			  ON pl.LocationID  = ppi.ProductID