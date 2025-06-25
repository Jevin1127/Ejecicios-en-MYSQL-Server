CREATE DATABASE SolicitudBeca
go
Use SolicitudBeca
go


CREATE SCHEMA Ubicaciones

CREATE TABLE Ubicaciones.Departamento (
  CodigoDepartamento INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_Departamento_CODIGODEPARTAMENTO
  PRIMARY KEY (CodigoDepartamento)
)

CREATE TABLE Ubicaciones.Municipio (
  CodigoMunicipio INT NOT NULL,
  CodigoDepartamento INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_Municipio_CODIGOMUNICIPIO
  PRIMARY KEY (CodigoMunicipio),
  CONSTRAINT FK_MunicipioDepartamento
  FOREIGN KEY (CodigoDepartamento)
  REFERENCES Ubicaciones.Departamento (CodigoDepartamento)
)

CREATE TABLE Ubicaciones.Aldea (
  CodigoAldea INT NOT NULL,
  CodigoMunicipio INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_Aldea_CODIGOALDEA
  PRIMARY KEY (CodigoAldea),
  CONSTRAINT FK_AldeaMunicipio
  FOREIGN KEY (CodigoMunicipio)
  REFERENCES Ubicaciones.Municipio(CodigoMunicipio)
)


CREATE TABLE Ubicaciones.Caserio (
  CodigoCaserio INT NOT NULL,
  CodigoAldea INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_Caserio_CODIGOCASERIO
  PRIMARY KEY (CodigoCaserio),
  CONSTRAINT FK_CaserioAldea
  FOREIGN KEY (CodigoAldea)
  REFERENCES Ubicaciones.Aldea(CodigoAldea)
)


CREATE SCHEMA TipoSexo

Create Table TipoSexo.Sexo (
  CodigoSexo INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_Sexo_CODIGOSEXO
  PRIMARY KEY (CodigoSexo)
)



CREATE SCHEMA TipoEstadoCivil

Create Table TipoEstadoCivil.EstadoCivil (
  CodigoEstadoCivil INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_EstadoCivil_CODICOESTADOCIVIL
  PRIMARY KEY (CodigoEstadoCivil)
)


Create Table SolicitudBeca (
  CodigoSolicitud INT NOT NULL,
  CodigoSexo INT NOT NULL,
  CodigoEstadoCivil INT NOT NULL,
  CodigoCaserio INT NOT NULL,
  PrimerNombre varchar (40),
  SegundoNombre varchar (40),
  PrimerApellido varchar (40),
  SegundoApellido varchar (40),
  NumeroIdentidad varchar (20),
  FechaNacimiento date,
  NumeroHijos int,
  OrigenEtnico varchar (20),
  DireccionResidencia varchar (40),
  CONSTRAINT PK_SolicitudBeca_CODICOSOLICITUDBECA
  PRIMARY KEY (CodigoSolicitud),
  CONSTRAINT FK_SolicitudBecaSexo
  FOREIGN KEY (CodigoSexo)
  REFERENCES TipoSexo.Sexo(CodigoSexo),
  CONSTRAINT FK_SolicitudBecaEstadoCivil
  FOREIGN KEY (CodigoEstadoCivil)
  REFERENCES TipoEstadoCivil.EstadoCivil(CodigoEstadoCivil),
  CONSTRAINT FK_SolicitudBecaCaserio
  FOREIGN KEY (CodigoCaserio)
  REFERENCES Ubicaciones.Caserio(CodigoCaserio)
)

CREATE SCHEMA Documentacion 

CREATE TABLE Documentacion.TipoDocumento (
  CodigoTipoDocumento INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_TipoDocumento_CODICOTIPODOCUMENTO
  PRIMARY KEY (CodigoTipoDocumento)
)

CREATE TABLE Documentacion.Documentos (
  CodigoDocumento INT NOT NULL,
  CodigoTipoDocumento INT NOT NULL,
  CodigoSolicitud INT NOT NULL,
  NombreArchivo varchar (40),
  CONSTRAINT PK_Documento_CODICODOCUMENTO
  PRIMARY KEY (CodigoDocumento),
  CONSTRAINT FK_DocumentosCodigoSolicitud
  FOREIGN KEY (CodigoSolicitud)
  REFERENCES SolicitudBeca(CodigoSolicitud),
  CONSTRAINT FK_DocumentosTipoDocumento
  FOREIGN KEY (CodigoTipoDocumento)
  REFERENCES Documentacion.TipoDocumento(CodigoTipoDocumento)
)


CREATE SCHEMA Ocupacion 

CREATE TABLE Ocupacion.TipoOcupacion (
  CodigoTipoOcupacion INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_TipoOcupacion_CODICOTIPOOCUPACION
  PRIMARY KEY (CodigoTipoOcupacion)
)

CREATE TABLE Ocupacion.OcupacionDetalle (
  CodigoTipoOcupacion INT NOT NULL,
  CodigoSolicitud INT NOT NULL,
  Descripcion varchar (40),
  CONSTRAINT PK_OcupacionDetalleCodigoSolicitud
  FOREIGN KEY (CodigoSolicitud)
  REFERENCES SolicitudBeca(CodigoSolicitud),
  CONSTRAINT PK_OcupacionDetalleCodigoTipoOcupacion
  FOREIGN KEY (CodigoTipoOcupacion)
  REFERENCES Ocupacion.TipoOcupacion(CodigoTipoOcupacion)
)


CREATE SCHEMA Discapacidades

CREATE TABLE Discapacidades.TipoDiscapacidad (
  CodigoTipoDiscapacidad INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_Discapacidades_CODIGOTIPODISCAPACIDAD
  PRIMARY KEY (CodigoTipoDiscapacidad)
)


CREATE TABLE Discapacidades.Discapacidad (
  CodigoTipoDiscapacidad INT NOT NULL,
  CodigoSolicitud INT NOT NULL,
  CONSTRAINT PK_Discapacidad_CODIGOTIPODISCAPACIDAD
  PRIMARY KEY (CodigoTipoDiscapacidad, CodigoSolicitud),
  CONSTRAINT FK_DiscapacidadCodigoSolicitud
  FOREIGN KEY (CodigoSolicitud)
  REFERENCES SolicitudBeca(CodigoSolicitud),
  CONSTRAINT FK_DiscapacidadCodigoTipoDiscapacidad
  FOREIGN KEY (CodigoTipoDiscapacidad)
  REFERENCES Discapacidades.TipoDiscapacidad(CodigoTipoDiscapacidad)
)


CREATE SCHEMA CorreoElectronico

CREATE TABLE CorreoElectronico.TipoCorreo (
  CodigoTipoCorreo INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_TipoCorreo_CODIGOTIPOCORREO
  PRIMARY KEY (CodigoTipoCorreo)
)

CREATE TABLE CorreoElectronico.Correo (
  CodigoSolicitud INT NOT NULL,
  CodigoTipoCorreo INT NOT NULL,
  Email varchar (40),
  CONSTRAINT fK_CorreoElectronicoCodigoSolicitud
  FOREIGN KEY (CodigoSolicitud)
  REFERENCES SolicitudBeca(CodigoSolicitud),
  CONSTRAINT FK_CorreoElectronicoCodigoTipoCorreo
  FOREIGN KEY (CodigoTipoCorreo)
  REFERENCES CorreoElectronico.TipoCorreo(CodigoTipoCorreo)
)


CREATE SCHEMA Telefonos 

CREATE TABLE Telefonos.TipoTelefono (
  CodigoTipoTelefono INT NOT NULL,
  Nombre varchar (40),
  CONSTRAINT PK_TipoTelefono_CODIGOTIPOTELEFONO
  PRIMARY KEY (CodigoTipoTelefono)
)


CREATE TABLE Telefonos.Telefono (
  CodigoSolicitud INT NOT NULL,
  CodigoTipoTelefono INT NOT NULL,
  NumeroTelefono varchar (40),
  CONSTRAINT fK_TelefonoCodigoSolicitud
  FOREIGN KEY (CodigoSolicitud)
  REFERENCES SolicitudBeca(CodigoSolicitud),
  CONSTRAINT FK_TelefonoCodigoTipoTelefono
  FOREIGN KEY (CodigoTipoTelefono)
  REFERENCES Telefonos.TipoTelefono(CodigoTipoTelefono)
)