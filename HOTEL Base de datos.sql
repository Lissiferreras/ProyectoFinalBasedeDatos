CREATE DATABASE HOTEL
GO
USE HOTEL

CREATE TABLE usuario(
	IdUsuario INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR(30) NOT NULL,
	Direccion VARCHAR(100) NOT NULL
)

CREATE TABLE empleados(
	IdEmpleados INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR(30) NOT NULL,
	Cargo VARCHAR(100) NOT NULL,
	Direccion VARCHAR(100) NOT NULL,
	Correo VARCHAR(50) NOT NULL
)


CREATE TABLE habitacion	(
	IdHabitacion INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Caracteristicas VARCHAR(400) NOT NULL,
	Precio FLOAT NOT NULL,
	TipoHabitacion VARCHAR(50) NOT NULL,
	NumHabitacion VARCHAR(50) NOT NULL,
	NumPiso INT NOT NULL
)

CREATE TABLE cliente(
	IdCliente INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Cedula VARCHAR(50) NOT NULL,
	Direccion VARCHAR(200)NOT NULL,
	Correo VARCHAR(50) NOT NULL,
	Contrasena VARCHAR(30) NOT NULL,
	Cargo VARCHAR(50) NOT NULL,
	Telefono VARCHAR(50) NOT NULL
)


CREATE TABLE recepcion(
	IdRecepcion INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	IdHabitacion INT,
	IdCliente INT NOT NULL,
	CantidadPersonas INT NOT NULL,
	TipoHabitacion VARCHAR(50) NOT NULL,
	FechaEntada DATE NOT NULL,
	FechaSalida DATE NOT NULL,

	CONSTRAINT FK_Recepcion_habitacion FOREIGN KEY (IdHabitacion) REFERENCES habitacion(IdHabitacion),
	CONSTRAINT FK_Recepcion_Cliente FOREIGN KEY (IdCliente) REFERENCES cliente(IdCliente)
)

CREATE TABLE reservacion(
	IdReservacion INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	FechaIngreso DATE NOT NULL,
	FechaSalida DATE NOT NULL,
	Cedula VARCHAR(50) NOT NULL,
	TipoHabitacion TEXT NOT NULL,
	CantidadPersonas INT NOT NULL
)

CREATE TABLE pago(
	IdPago INT PRIMARY KEY IDENTITY(1,1),
	NombreCliente VARCHAR(50) NOT NULL,
	IdCliente INT NOT NULL,
	ConceptoPago VARCHAR(200) NOT NULL,
	Fecha DATE NOT NULL,
	Total FLOAT NOT NULL,
	CONSTRAINT FK_PagoCliente FOREIGN KEY (IdCliente) REFERENCES cliente(IdCliente)
)


INSERT INTO usuario (Nombre, Apellido, Direccion) VALUES ('Luis','Rodriguez','Los 3 brazos'),
('Robin','Alberto','Piedra Blanca de Bonao'), ('Pablo','Contrera','Los guandules'),('Carmen','Perez','Las flores'),
('Raul','Alberto','Maimon'),('Ranlly','Donminguez','Quinto Centenario'),('Johelin','Balcase','Quinto Centenario'),
('Moises','Peguero','Quinto Centenario'),('Priscila','Galvez','Los 3 Angeles'),('Jazmin','Castro','Los 3 Angeles'),
('Alejandra','Fernandez','Piedra Blanca'),('Santo Rey','Felipe','Bonao')

SELECT * FROM empleados

INSERT INTO empleados (Nombre, Apellido, Cargo, Direccion, Correo) 
VALUES 
('Camilo','Mendes','Director','Bonao','camilo@gmail.com'),('Julio','Perez','Guardia','Bonao','julio@gmail.com'),
('Ranlly','Mmatos','Administrador','Bonao','ranlly@gmail.com'),('Baneza','Mendes','Administrador','Bonao','baneza@gmail.com'),
('Bianca','Mena','Administrador','Bonao','Bianca@gmail.com'),('Monin','Perez','Administrador','Bonao','monin@gmail.com'),
('Jony','Mendes','Director','Bonao','jony@gmail.com')


SELECT * FROM empleados

INSERT INTO habitacion (Caracteristicas, Precio, TipoHabitacion, NumHabitacion, NumPiso)
VALUES 
('Habitación doble con baño y salón de 12 m2 de superficie mínima Junior.','5000','Suite','2','2'),
('Habitación doble con baño y salón de 5 m2 de superficie mínima.','1000','Junior suite','1','1'),
('Habitación doble con baño y salón de 8 m2 de superficie mínima.','1500','Junior suite','2','2'),
('Habitación doble con baño y salón de 8 m2 de superficie mínima.','2500','Junior suite','2','2'),
('Habitación doble con baño y salón de 8 m2 de superficie mínima.','2500','Junior suite','2','2'),
('Habitación doble con baño y salón de 8 m2 de superficie mínima.','2500','Junior suite','2','2'),
('Habitación doble con baño y salón de 8 m2 de superficie mínima.','2500','Junior suite','2','2'),
('Habitación doble con baño y salón de 8 m2 de superficie mínima.','2500','Junior suite','2','2'),
('Habitación doble con baño y salón de 8 m2 de superficie mínima.','2500','Junior suite','2','2'),
('Dos o más habitaciones dobles con sus correspondientes baños y un salón en común. La gran suite debe ser comercializada en todo su conjunto.','9000','Gran suite','2','2')

SELECT * FROM habitacion


INSERT INTO cliente (Nombre, Apellido, Cedula, Direccion, Correo, Contrasena, Cargo, Telefono) 
VALUES 
('Capellan','Castro','123-0000022-1','Los Montes','capellan@gmail.com','capellan123','usuario','809-444-0000'),
('Jonny','Mejia','123-0002022-2','Los Rios','Jonny@gmail.com','ana123','usuario','809-444-1180'),
('German','Castro','123-0000022-1','Los Montes','German@gmail.com','capellan123','usuario','809-444-0200'),
('Julio','Mejia','123-0002022-2','Los Rios','Julio@gmail.com','ana123','usuario','809-444-1130'),
('Cesar','Castro','123-0000022-1','Los Montes','Cesar@gmail.com','capellan123','usuario','809-444-0030'),
('Carlos','Mejia','123-0002022-2','Los Rios','Carlos@gmail.com','ana123','usuario','809-444-1120'),
('Emilio','Castro','123-0000022-1','Los Montes','Emilio@gmail.com','capellan123','usuario','809-444-1000'),
('Anthony','Mejia','123-0002022-2','Los Rios','Anthony@gmail.com','ana123','usuario','809-444-1110')


SELECT * FROM cliente

INSERT INTO recepcion (IdHabitacion,IdCliente, CantidadPersonas,TipoHabitacion,FechaEntada,FechaSalida) 
VALUES
('2','2','2','Suite','01/06/2020','02/06/2020'),('2','2','3','Suite','01/06/2020','02/06/2020'),
('3','3','2','Suite','01/06/2020','02/06/2020'),('3','3','3','Suite','01/06/2020','02/06/2020'),
('4','4','2','Suite','01/06/2020','02/06/2020'),('4','4','3','Suite','01/06/2020','02/06/2020'),
('5','5','2','Suite','01/06/2020','02/06/2020'),('5','5','3','Suite','01/06/2020','02/06/2020'),
('6','6','2','Suite','01/06/2020','02/06/2020'),('6','6','3','Suite','01/06/2020','02/06/2020')

SELECT * FROM recepcion

INSERT INTO reservacion (FechaIngreso, FechaSalida, Cedula, TipoHabitacion, CantidadPersonas)
VALUES
('01/06/2020','02/06/2020','123-0010022-1','Suite','2'),('01/06/2020','02/06/2020','123-0550222-1','Suite','2'),
('01/06/2020','02/06/2020','123-0050022-1','Suite','2'),('01/06/2020','02/06/2020','123-0550422-1','Suite','2'),
('01/06/2020','02/06/2020','123-0040022-1','Suite','2'),('01/06/2020','02/06/2020','123-0550422-1','Suite','2'),
('01/06/2020','02/06/2020','123-0010022-1','Suite','2'),('01/06/2020','02/06/2020','123-0550222-1','Suite','2'),
('01/06/2020','02/06/2020','123-0050022-1','Suite','2'),('01/06/2020','02/06/2020','123-0550922-1','Suite','2')

SELECT * FROM reservacion

INSERT INTO pago (NombreCliente, IdCliente, ConceptoPago, Fecha, Total)
VALUES
('Carlos','1','Efectivo','02/06/2020','5000'),('Coral','2','Efectivo','02/06/2020','2500'),
('Naldo','1','Efectivo','02/06/2020','5000'),('Melisa','2','Efectivo','02/06/2020','2500'),
('Perla','1','Efectivo','02/06/2020','5000'),('Frnacisco','2','Efectivo','02/06/2020','2500'),
('Meregildo','1','Efectivo','02/06/2020','5000'),('Jose Luis','2','Efectivo','02/06/2020','2500'),
('Alberto','1','Efectivo','02/06/2020','5000'),('Luis','2','Efectivo','02/06/2020','2500')

SELECT * FROM pago