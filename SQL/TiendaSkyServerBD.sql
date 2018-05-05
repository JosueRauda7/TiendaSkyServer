use master
go
create database TiendaSkyServerDB
go
use TiendaSkyServerDB
go
create table Usuario(
	id_usuario int IDENTITY(1,1) NOT NULL,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	password varchar(30) not null,
	dui varchar(10) not null,
	tipo_usuario char(1) not null,
	estado BIT not null,
)
go
alter table Usuario
add constraint PK_Usuario
primary key clustered (id_usuario)
go
create table Catalogo(
	id_catalogo int IDENTITY(1,1) not null,
	nombre_catalogo varchar(30) not null,
	descripcion varchar(120) not null,
)
go
alter table Catalogo
add constraint PK_Catalogo
primary key clustered (id_catalogo)
go
create table Aviso(
	id_aviso int IDENTITY(1,1) not null,
	descripcion varchar(120) not null,
	id_usuario int not null
)
go
alter table Aviso
add constraint PK_Aviso
primary key clustered (id_aviso)
go
alter table Aviso
add constraint FK_Aviso
foreign key (id_usuario) references Usuario(id_usuario)
go
create table Producto(
	id_producto int IDENTITY(1,1) not null,
	existencias int not null,
	descripcion varchar(120) not null,
	precio_unidad decimal not null,
	id_catalogo int not null
)
go
alter table Producto
add constraint PK_Producto
primary key clustered(id_producto)
go
alter table Producto
add constraint FK_Producto
foreign key (id_catalogo) references Catalogo(id_catalogo)
go
create table Venta(
	id_venta int IDENTITY(1,1) not null,
	fecha_venta date not null,
	monto decimal not null,
	id_usuario int not null,
	id_producto int not null
)
go
alter table Venta
add constraint PK_Venta
primary key clustered (id_venta)
go
alter table Venta
add constraint FK_Venta_Usuario
foreign key (id_usuario) references Usuario(id_usuario)
go
alter table Venta
add constraint FK_Venta_Producto
foreign key (id_producto) references Producto(id_producto)
go
create table Compra(
	id_venta int IDENTITY(1,1) not null,
	fecha_compra date not null,
	monto decimal not null,
	cantidad int not null,
	id_usuario int not null,
	id_producto int not null
)
go
alter table Compra
add constraint PK_Compra
primary key clustered (id_venta)
go
alter table Compra
add constraint FK_Compra_Usuario
foreign key (id_usuario) references Usuario(id_usuario)
go
alter table Compra
add constraint FK_Compra_Producto
foreign key (id_producto) references Producto(id_producto)
go