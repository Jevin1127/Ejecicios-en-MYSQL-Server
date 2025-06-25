CREATE DATABASE Museo
GO
USE Museo
GO

CREATE TABLE TipoObjetoArte (
  IdTipoObjetoArte INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_TipoObjetoArte_IDOBJETOARTE
  PRIMARY KEY (IdTipoObjetoArte)
)


CREATE TABLE Epoca (
  IdEpoca INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_Epoca_IDEPOCA
  PRIMARY KEY (IdEpoca)
)


CREATE TABLE Pais (
  IdPais INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_Pais_IDPAIS
  PRIMARY KEY (IdPais)
)


CREATE TABLE EstiloArtista (
  IdEstiloArtista INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_EstiloArtista_IDESTILOARTISTA
  PRIMARY KEY (IdEstiloArtista)
)


CREATE TABLE ATRIBUTOSARTISTA.Artista (
  IdArtista INT NOT NULL,
  IdPais INT NOT NULL,
  IdEpoca INT NOT NULL,
  IdEstiloArtista INT NOT NULL,
  Nombre varchar (40) UNIQUE,
  FechaNacimiento date,
  FechaFallecimiento date,
  Descripcion varchar (50),

  CONSTRAINT PK_Artista_IDARTISTA
  PRIMARY KEY (IdArtista),

  CONSTRAINT FK_Pais
  FOREIGN KEY (IdPais)
  REFERENCES Pais (IdPais),
  CONSTRAINT FK_Epoca
  FOREIGN KEY (IdEpoca)
  REFERENCES Epoca (IdEpoca),
  CONSTRAINT FK_EstiloArtista
  FOREIGN KEY (IdEstiloArtista)
  REFERENCES EstiloArtista(IdEstiloArtista)
)


CREATE TABLE ObjetoArte (
  IdObjetoArte INT NOT NULL,
  IdPais INT NOT NULL,
  IdEpoca INT NOT NULL,
  IdEstiloArtista INT NOT NULL,
  IdArtista INT NOT NULL,
  Titulo varchar (40),
  AnioCreacion date,
  Descripcion varchar (50),

  CONSTRAINT PK_Objeto_IDOBJETOARTE
  PRIMARY KEY (IdObjetoArte),


  FOREIGN KEY (IdPais)
  REFERENCES Pais (IdPais),
  FOREIGN KEY (IdEpoca)
  REFERENCES Epoca (IdEpoca),
  FOREIGN KEY (IdEstiloArtista)
  REFERENCES EstiloArtista(IdEstiloArtista),
  FOREIGN KEY (IdArtista)
  REFERENCES Artista(IdArtista)
)

CREATE SCHEMA PINTURA

CREATE TABLE PINTURA.TipoPintura (
  IdTipoPintura INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_TipoPintura_IDTIPOPINTURA
  PRIMARY KEY (IdTipoPintura)
)

CREATE TABLE PINTURA.EstiloPintura (
  IdEstiloPintura INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_EstiloPintura_IDESTILOPINTURA
  PRIMARY KEY (IdEstiloPintura)
)

CREATE TABLE PINTURA.MaterialPintura (
  IdMaterialPintura INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_MaterialPintura_IDMATERIALPINTURA
  PRIMARY KEY (IdMaterialPintura)
)


CREATE TABLE PINTURA.Pintura (
  IdObjetoArte INT NOT NULL,
  IdTipoPintura INT NOT NULL,
  IdEstiloPintura INT NOT NULL,
  IdMaterialPintura INT NOT NULL,

  CONSTRAINT PK_Pintura_IDOBJETOARTE
  PRIMARY KEY (IdObjetoArte),

  FOREIGN KEY (IdObjetoArte)
  REFERENCES ObjetoArte(IdObjetoArte),

  FOREIGN KEY (IdTipoPintura)
  REFERENCES PINTURA.TipoPintura (IdTipoPintura),

  FOREIGN KEY (IdEstiloPintura)
  REFERENCES PINTURA.EstiloPintura(IdEstiloPintura),

  FOREIGN KEY (IdMaterialPintura)
  REFERENCES PINTURA.MaterialPintura(IdMaterialPintura)
)


CREATE SCHEMA ESCULTURA

CREATE TABLE ESCULTURA.MaterialEscultura (
  IdMaterialEscultura INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_MaterialEscultura_IDMATERIALESCULTURA
  PRIMARY KEY (IdMaterialEscultura)
)

CREATE TABLE ESCULTURA.EstiloEscultura (
  IdEstiloEscultura INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_EstiloEscultura_IDESTILOESCULTURA
  PRIMARY KEY (IdEstiloEscultura)
)

CREATE TABLE ESCULTURA.Escultura (
  IdObjetoArte INT NOT NULL,
  IdEstiloEscultura INT NOT NULL,
  IdMaterialEscultura INT NOT NULL,
  Altura varchar (30),
  Anchura varchar (30),

  CONSTRAINT PK_Escultura_IDOBJETOARTE
  PRIMARY KEY (IdObjetoArte),

  FOREIGN KEY (IdObjetoArte)
  REFERENCES ObjetoArte(IdObjetoArte),

  FOREIGN KEY (IdEstiloEscultura)
  REFERENCES ESCULTURA.EstiloEscultura(IdEstiloEscultura),

  FOREIGN KEY (IdMaterialEscultura)
  REFERENCES ESCULTURA.MaterialEscultura(IdMaterialEscultura)

)


CREATE SCHEMA OTROSESTILOS

CREATE TABLE OTROSESTILOS.EstiloOtro (
  IdEstiloOtro INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_EstiloOtro_IDESTILOOTRO
  PRIMARY KEY (IdEstiloOtro)
)

CREATE TABLE OTROSESTILOS.TipoObraOtro (
  IdObra INT NOT NULL,
  Nombre varchar (30),
  CONSTRAINT PK_TipoObraOtro_IDOBRA
  PRIMARY KEY (IdObra)
)


CREATE TABLE ESCULTURA.Otro (
  IdObjetoArte INT NOT NULL,
  IdObra INT NOT NULL,
  IdEstiloOtro INT NOT NULL,


  CONSTRAINT PK_Otro_IDOBJETOARTE
  PRIMARY KEY (IdObjetoArte),

  FOREIGN KEY (IdObjetoArte)
  REFERENCES ObjetoArte(IdObjetoArte),

  FOREIGN KEY (IdObra)
  REFERENCES OTROSESTILOS.TipoObraOtro(IdObra),
  FOREIGN KEY (IdEstiloOtro)
  REFERENCES OTROSESTILOS.EstiloOtro(IdEstiloOtro)

)

CREATE SCHEMA EXHIBICION 

CREATE TABLE EXHIBICION.Exhibicion (
  IdExhibicion INT NOT NULL,
  Nombre varchar (30),
  FechaInicio date,
  FechaFinalizacion date,
  CONSTRAINT PK_Exhibicion_IDEXHIBICION
  PRIMARY KEY (IdExhibicion)
)


CREATE TABLE EXHIBICION.ObjetoArteExhibicion (
  IdObjetoArte INT NOT NULL,
  IdExhibicion INT NOT NULL,

  CONSTRAINT PK_ObjetoArteExhibicion_IDOBJETOARTEEXHIBICION
  PRIMARY KEY (IdObjetoArte),

  FOREIGN KEY (IdObjetoArte)
  REFERENCES ObjetoArte(IdObjetoArte),

  FOREIGN KEY (IdExhibicion)
  REFERENCES EXHIBICION.Exhibicion(IdExhibicion)
)


CREATE SCHEMA COLECCION

CREATE TABLE COLECCION.TipoColeccion (
  IdTipoColeccion INT NOT NULL,
  Nombre varchar (30),

  CONSTRAINT PK_TipoColeccion_IDTIPOCOLECCION
  PRIMARY KEY (IdTipoColeccion)
)


CREATE TABLE COLECCION.Coleccion (
  IdObjetoArte INT NOT NULL,
  IdColeccion INT NOT NULL,
  Nombre varchar (40) UNIQUE,
  Descripcion varchar (30),
  Direccion varchar (30),
  Telefono varchar (30),
  PersonaContacto varchar (30),

  CONSTRAINT PK_Coleccion_IDCOLECCION
  PRIMARY KEY (IdColeccion),

  FOREIGN KEY (IdTipoColeccion)
  REFERENCES COLECCION.TipoColeccion(IdTipoColeccion),
)


CREATE TABLE COLECCION.Prestado (
  IdObjetoArte INT NOT NULL,
  IdTipoColeccion INT NOT NULL,
  IdColeccion INT NOT NULL,
  FechaPrestamo date,
  FechaDevolucion date,

  CONSTRAINT PK_Prestado_IDTIPOCOLECCION
  PRIMARY KEY (IdObjetoArte),

  FOREIGN KEY (IdObjetoArte)
  REFERENCES ObjetoArte(IdObjetoArte),

  FOREIGN KEY (IdColeccion)
  REFERENCES COLECCION.Coleccion(IdColeccion)
)

CREATE SCHEMA ESTADO

CREATE TABLE ESTADO.Estado (
  IdEstado INT NOT NULL,
  Nombre varchar (30),

  CONSTRAINT PK_Estado_IDESTADO
  PRIMARY KEY (IdEstado)
)

CREATE TABLE ESTADO.Prestado (
  IdObjetoArte INT NOT NULL,
  IdEstado INT NOT NULL,
  FechaAdquision date,

  CONSTRAINT PK_Prestado_IDOBJETOARTE
  PRIMARY KEY (IdObjetoArte),

  FOREIGN KEY (IdObjetoArte)
  REFERENCES ObjetoArte(IdObjetoArte),

  FOREIGN KEY (IdEstado)
  REFERENCES ESTADO.Estado(IdEstado)
)

