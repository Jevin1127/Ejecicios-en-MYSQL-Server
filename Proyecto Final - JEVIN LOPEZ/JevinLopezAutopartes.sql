CREATE DATABASE JevinLopezAutopartes
GO
USE JevinLopezAutopartes
GO


-- CREACION DE LA BASE DE DATOS --

CREATE SCHEMA DatosEstablecimiento

CREATE TABLE DatosEstablecimiento.TipoDireccion (
  IdTipoDireccion INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_TipoDireccion_IDDIRECCION
  PRIMARY KEY (IdTipoDireccion)
)

CREATE TABLE DatosEstablecimiento.Sucursal (
  IdSucursal INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_Sucursal_IDSUCURSAL
  PRIMARY KEY (IdSucursal)
)

CREATE TABLE DatosEstablecimiento.Telefono (
  IdTelefono INT NOT NULL,
  IdSucursal INT NOT NULL,
  NumeroTelefono varchar (15),
  CONSTRAINT PK_Telefono_IDTELEFONO
  PRIMARY KEY (IdTelefono),
  
  CONSTRAINT FK_Sucursal
  FOREIGN KEY (IdSucursal)
  REFERENCES DatosEstablecimiento.Sucursal (IdSucursal)
)


CREATE TABLE DatosEstablecimiento.Direccion (   
  IdDireccion INT NOT NULL,
  IdTipoDireccion INT NOT NULL,
  IdSucursal INT NOT NULL,
  Calle varchar (100),
  Bloque varchar (100),

  CONSTRAINT PK_Direccion_IDDIRECCION
  PRIMARY KEY (IdDireccion),

  CONSTRAINT FK_TipoDireccion
  FOREIGN KEY (IdTipoDireccion)
  REFERENCES DatosEstablecimiento.TipoDireccion (IdTipoDireccion),

  FOREIGN KEY (IdSucursal)
  REFERENCES DatosEstablecimiento.Sucursal (IdSucursal)
)


CREATE SCHEMA DetallesAuto


CREATE TABLE DetallesAuto.Marca (
  IdMarca INT NOT NULL,
  Nombre varchar (15),

  CONSTRAINT PK_Marca_IDMARCA
  PRIMARY KEY (IdMarca)
)

CREATE TABLE DetallesAuto.Modelo (
  IdModelo INT NOT NULL,
  IdMarca INT NOT NULL,
  Nombre varchar (15),

  CONSTRAINT PK_Modelo_IDMODELO
  PRIMARY KEY (IdModelo),
  CONSTRAINT FK_Marca
  FOREIGN KEY (IdMarca)
  REFERENCES DetallesAuto.Marca (IdMarca)
)


CREATE SCHEMA Inventario

CREATE TABLE Inventario.TipoParte (
  IdTipoParte INT NOT NULL,
  Descripcion varchar (40),

  CONSTRAINT PK_TipoParte_IDTIPOPARTE
  PRIMARY KEY (IdTipoParte)
)

CREATE TABLE Inventario.Estado (
  IdEstado INT NOT NULL,
  Nombre varchar (50),

  CONSTRAINT PK_Estado_IDESTADO
  PRIMARY KEY (IdEstado)
)

CREATE TABLE Automovil (
  IdAutomovil INT NOT NULL,
  IdSucursal INT NOT NULL,
  IdEstado INT NOT NULL,
  IdModelo INT NOT NULL,
  Anio varchar (10),
  Precio varchar (10),
  FechaCompra Date ,
  FechaIngreso Date,
  CantidadMillas varchar (10),

  CONSTRAINT PK_Automovil_IDAUTOMOVIL
  PRIMARY KEY (IdAutomovil),

  FOREIGN KEY (IdSucursal)
  REFERENCES DatosEstablecimiento.Sucursal(IdSucursal),
  CONSTRAINT PK_Estado_IDESTADO
  FOREIGN KEY (IdEstado)
  REFERENCES Inventario.Estado(IdEstado),
  CONSTRAINT PK_Modelo_IDMODELO
  FOREIGN KEY (IdModelo)
  REFERENCES DetallesAuto.Modelo(IdModelo)
)


CREATE TABLE Inventario.Inventario (
  IdAutomovil INT NOT NULL,
  IdTipoParte INT NOT NULL,
  IdEstado INT NOT NULL,
  PrecioVenta varchar (10),

  CONSTRAINT PK_Inventario_IDINVENTARIO
  PRIMARY KEY (IdAutomovil, IdTipoParte),

  CONSTRAINT FK_TipoParte_IDTIPOPARTE
  FOREIGN KEY (IdTipoParte)
  REFERENCES Inventario.TipoParte (IdTipoParte),
  CONSTRAINT FK_Automovil_IDAUTOMOVIL
  FOREIGN KEY (IdAutomovil)
  REFERENCES Automovil(IdAutomovil),
  FOREIGN KEY (IdEstado)
  REFERENCES Inventario.Estado(IdEstado)
)