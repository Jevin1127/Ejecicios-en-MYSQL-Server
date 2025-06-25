USE JevinLopezAutopartes
GO

-- En este scrip se hará la inserción de datos a la base de datos
-- de JevinLopezAutopartes

-- INSERCIÓN DE DATOS EN LA TABAL DE TIPO DIRECCIÓN Y DEMOSTRACIÓN DE LA TABLA--

INSERT INTO DatosEstablecimiento.TipoDireccion(IdTipoDireccion, Nombre)
VALUES('1', 'Oficina'),
      ('2', 'Trabajo'),
      ('3', 'Personal'),
      ('4', 'Secundaria'),
      ('5', 'Taller');

SELECT Nombre FROM DatosEstablecimiento.TipoDireccion


-- INSERCION DE DATOS EN LAS TABLAS DIRECCION, SUCURSALES Y TELEFONO 

INSERT INTO  DatosEstablecimiento.Sucursal(IdSucursal, Nombre)
VALUES('1', 'Principal - Centro'),
      ('2', 'City Mall'),
      ('3', 'Metromall'),
      ('4', 'La Hacienda');

INSERT INTO  DatosEstablecimiento.Direccion(IdDireccion,IdTipoDireccion,IdSucursal, Calle)
VALUES('1',  '1', '1','Ubicada en la calle CA, Bloque BA, dirección del tipo Oficina'),
      ('2', '2', '2', 'Ubicada en la calle CB, Bloque BB, dirección del tipo Oficina'),
      ('3', '3', '3','Ubicada en la calle CC, Bloque BC, dirección del tipo Taller'),
      ('4', '4', '4',  'Ubicada en la calle CD, Bloque BD, dirección del tipo Trabajo');

INSERT INTO  DatosEstablecimiento.Telefono(IdTelefono, IdSucursal, NumeroTelefono)
VALUES('1', '1', '99999901'),
      ('2', '2', '99999902'),
      ('3', '3', '99999903'),
      ('4', '4','99999904');

	  	  SELECT 
	          s.Nombre AS Sucursales,
			  d.Calle AS Direccion,
			  t.NumeroTelefono AS Telefono

	          FROM DatosEstablecimiento.Sucursal s

			  JOIN DatosEstablecimiento.Direccion d
			  ON d.IdDireccion = s.IdSucursal
			  JOIN DatosEstablecimiento.Telefono t
			  ON t.IdTelefono = s.IdSucursal


-- INSERCIÓN DE DATOS EN LAS TABLAS MARCAS Y MODELOS -- 


SELECT Nombre FROM DetallesAuto.Modelo

INSERT INTO  DetallesAuto.Marca(IdMarca, Nombre)
VALUES('1', 'BMW'),
      ('2', 'Ford'),
      ('3', 'Toyota'),
	  ('4', 'Honda'),
      ('5', 'Honda'),
	  ('6', 'Toyota');

INSERT INTO  DetallesAuto.Modelo(IdModelo,IdMarca, Nombre)
VALUES('1', '1', '3 Series'),
      ('2', '2', 'F-150'),
      ('3', '3', 'Prius'),
	  ('4', '4',  'Civic'),
      ('5', '5', 'CRV'),
	  ('6', '6', 'Hilux');

	  	  	SELECT 
	          m.Nombre AS Marca,
			  mm.Nombre AS Modelo

	          FROM DetallesAuto.Marca m

			  JOIN DetallesAuto.Modelo mm
			  ON mm.IdModelo = m.IdMarca

