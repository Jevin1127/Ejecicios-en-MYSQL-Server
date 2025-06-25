CREATE DATABASE Peliculas
GO 
USE Peliculas 
GO

CREATE TABLE Productora (
  IdProductora INT,
  Nombre varchar (60),
  Direccion varchar (70),
  CONSTRAINT PK_Productora_IDPRODUCTORA 
  PRIMARY KEY (IdProductora)
)


CREATE TABLE Genero (
  IdGenero INT,
  Nombre varchar (60),
  CONSTRAINT PK_Genero_IDGENERO
  PRIMARY KEY (IdGenero)
)


CREATE TABLE Pelicula (
  IdPelicula INT,
  IdProductora INT,
  Titulo varchar (30),
  AñoProyeccion Date,
  Duracion varchar (20),
  Sinopsis varchar (200),
  ResumenTrama varchar (200),
  CONSTRAINT PK_Pelicula_IDPELICULA
  PRIMARY KEY (IdPelicula),
  CONSTRAINT FK_Pelicula_Productora
  FOREIGN KEY (IdProductora)
  REFERENCES Productora(IdProductora)
)


CREATE TABLE PeliculaGenero (
  IdPelicula INT,
  IdGenero INT,
  CONSTRAINT PK_PeliculaGenero_IDPELICULAGENERO
  PRIMARY KEY (IdPelicula, IdGenero),
  CONSTRAINT FK_PeliculaGenero_Pelicula
  FOREIGN KEY (IdPelicula)
  REFERENCES Pelicula(IdPelicula),
  CONSTRAINT FK_PeliculaGenero_Genero
  FOREIGN KEY (IdGenero)
  REFERENCES Genero(IdGenero)
)


CREATE TABLE Pais (
  IdPais INT,
  Nombre varchar (60),
  CONSTRAINT PK_Pais_IDPAIS
  PRIMARY KEY (IdPais)
)



CREATE TABLE Director (
  IdDirector INT,
  IdPaisNacimiento INT,
  Nombre varchar (60),
  FechaNacimiento date,
  CONSTRAINT PK_Director_IDDIRECTOR
  PRIMARY KEY (IdDirector),
  CONSTRAINT FK_DirectorPais_Pais
  FOREIGN KEY (IdPaisNacimiento)
  REFERENCES Pais(IdPais)
)


CREATE TABLE PeliculaDirector (
  IdPelicula INT,
  IdDirector INT,
  CONSTRAINT PK_PeliculaDirector_IDPELICULADIRECTOR
  PRIMARY KEY (IdPelicula, IdDirector),
  CONSTRAINT FK_PeliculaDirector_Director
  FOREIGN KEY (IdDirector)
  REFERENCES Director(IdDirector),
  CONSTRAINT FK_PeliculaDirector_Pelicula
  FOREIGN KEY (IdPelicula)
  REFERENCES Pelicula(IdPelicula)
)


CREATE TABLE Actor (
  IdActor INT,
  IdPaisNacimiento INT,
  Nombre varchar (60),
  FechaNacimiento date,
  FechaIncio date,
  CONSTRAINT PK_Actor_IDACTOR
  PRIMARY KEY (IdActor),
  CONSTRAINT FK_ActorPais_Pais
  FOREIGN KEY (IdPaisNacimiento)
  REFERENCES Pais(IdPais)
)


CREATE TABLE CitaReseñables (
  IdCita INT,
  IdPelicula INT,
  IdActor INT,
  Cita varchar (30),
  CONSTRAINT PK_CitasReseñanles_IDCITA
  PRIMARY KEY (IdCita),
  CONSTRAINT FK_CitaReseñables_Pelicula
  FOREIGN KEY (IdPelicula)
  REFERENCES Pelicula(IdPelicula),
  CONSTRAINT FK_CitaReseñables_Actor
  FOREIGN KEY (IdActor)
  REFERENCES Actor(IdActor)
)


CREATE TABLE Papel (
  IdPapel INT,
  Nombre varchar (60),
  CONSTRAINT PK_Papel_IDPAPEL
  PRIMARY KEY (IdPapel),
)


CREATE TABLE PeliculaActor (
  IdPelicula INT,
  IdActor INT,
  IdPapel INT,
  CONSTRAINT PK_PeliculasActor_IDPELICULAACTOR
  PRIMARY KEY (IdPelicula, IdActor),
  CONSTRAINT FK_PeliculasActor_Pelicula
  FOREIGN KEY (IdPelicula)
  REFERENCES Pelicula(IdPelicula),
  CONSTRAINT FK_PeliculasActor_Actor
  FOREIGN KEY (IdActor)
  REFERENCES Actor(IdActor)
)
