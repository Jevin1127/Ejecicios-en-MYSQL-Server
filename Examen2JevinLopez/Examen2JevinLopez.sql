CREATE DATABASE Examen2JevinLopez
GO
USE Examen2JevinLopez
GO

CREATE TABLE Instalacion (
  IdInstalacion INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_Instalacion_IDINSTALACION
  PRIMARY KEY (IdInstalacion)
)

CREATE TABLE TipoComplejo (
  IdTipoComplejo INT NOT NULL,
  Nombre varchar (50),
  CONSTRAINT PK_TipoComplejo_IDTIPOCOMPLEJO
  PRIMARY KEY (IdTipoComplejo)
)

CREATE TABLE Localizacion (
  IdLocalizacion INT NOT NULL,
  Nombre varchar (60),
  CONSTRAINT PK_Localizacion_IDLOCALIZACION
  PRIMARY KEY (IdLocalizacion)
)


CREATE TABLE Complejo (
  IdComplejo INT NOT NULL,
  IdTipoComplejo INT NOT NULL,
  IdInstalacion INT NOT NULL,
  IdLocalizacion INT NOT NULL,
  Nombre varchar (40),
  Tamaño varchar (20),
  Jefe varchar (20),
  FechaFundacion date,
  MaximoEspectadores varchar (50),

  CONSTRAINT PK_Complejo_IDCOMPLEJO
  PRIMARY KEY (IdComplejo),

  CONSTRAINT FK_TipoComplejo
  FOREIGN KEY (IdTipoComplejo)
  REFERENCES TipoComplejo (IdTipoComplejo),

  CONSTRAINT FK_Instalacion
  FOREIGN KEY (IdInstalacion)
  REFERENCES Instalacion (IdInstalacion),

  CONSTRAINT FK_Localizacion
  FOREIGN KEY (IdLocalizacion)
  REFERENCES Localizacion(IdLocalizacion)
)

CREATE TABLE Especialidad (
  IdEspecialidad INT NOT NULL,
  Nombre varchar (20),
  CONSTRAINT PK_Especialidad_IDESPECIALIDAD
  PRIMARY KEY (IdEspecialidad)
)

CREATE TABLE Ubicacion (
  IdUbicacion INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_Ubicacion_IDUBICACION
  PRIMARY KEY (IdUbicacion)
)

CREATE TABLE Area (
  IdArea INT NOT NULL,
  IdComplejo INT NOT NULL,
  IdEspecialidad INT NOT NULL,
  IdUbicacion INT NOT NULL,
  Nombre varchar (40),

  CONSTRAINT PK_Area_IDAREA
  PRIMARY KEY (IdArea),

  CONSTRAINT FK_Complejo
  FOREIGN KEY (IdComplejo)
  REFERENCES Complejo (IdComplejo),

  CONSTRAINT FK_Especialidad
  FOREIGN KEY (IdEspecialidad)
  REFERENCES Especialidad (IdEspecialidad),

  CONSTRAINT FK_Ubicacion
  FOREIGN KEY (IdUbicacion)
  REFERENCES Ubicacion (IdUbicacion)
)


CREATE TABLE Evento (
  IdEvento INT NOT NULL,
  IdComplejo INT NOT NULL,
  Fecha date,
  Duracion varchar (10),
  NumeroParticipantes int,

  CONSTRAINT PK_Evento_IDEVENTO
  PRIMARY KEY (IdEvento),

  FOREIGN KEY (IdComplejo)
  REFERENCES Complejo (IdComplejo)
)


CREATE TABLE Juez (
  IdJuez INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_Juez_IDJUEZ
  PRIMARY KEY (IdJuez)
)


CREATE TABLE EventoJuez (
  IdEvento INT NOT NULL,
  IdJuez  INT NOT NULL,

  CONSTRAINT PK_EventoJuez_IDEVENTO_IDJUEZ
  PRIMARY KEY (IdEvento, IdJuez),

  CONSTRAINT FK_EventoJuez
  FOREIGN KEY (IdEvento)
  REFERENCES Evento (IdEvento),

  CONSTRAINT FK_Juez
  FOREIGN KEY (IdJuez)
  REFERENCES Juez (IdJuez)
)


