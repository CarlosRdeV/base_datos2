/*creacion de DB*/

CREATE DATABASE Oracle;

/*creacion de tablas*/
CREATE TABLE puestos (
id_puesto int not null primary key,
descripcion char(50) not null);

CREATE TABLE miembros (id_miembro int primary key not null,
nombre char(50) not null,
id_puesto int not null foreign key references puestos(id_puesto),
direccion char(50) not null,
numtel char(15) null,
numtelof char(15) null,
estatus char(30) null
);


CREATE TABLE cuotas (id_cuota int primary key not null,
id_miembro int not null foreign key references miembros(id_miembro),
anualidad float(8) not null,
fechavencimiento date not null
);

CREATE TABLE tipocompania (id_tipo int not null primary key,
descripcion char(50) not null
);

CREATE TABLE companias (id_compania int not null primary key,
nombre char(50) not null,
direccion char(50) not null,
id_tipo int not null foreign key references tipocompania(id_tipo)
);

CREATE TABLE eventos (id_evento int not null primary key,
nombre char(50) not null,
lugar char(50) not null,
fecha date not null
);

CREATE TABLE comentarios (id_comentario int not null primary key,
id_evento int not null foreign key references eventos(id_evento),
gasto float (8) not null,
comentario char(100) not null,
);

/*tabla de rompimiento*/
CREATE TABLE miembroseventos (id_miembroseventos int not null primary key,
id_evento int not null foreign key references eventos(id_evento),
id_miembro int not null foreign key references miembros(id_miembro),
);


/*selects*/
select * from puestos;
select * from miembros;
select * from cuotas;
select * from tipocompania;
select * from companias;
select * from eventos;
select * from comentarios;
select * from miembroseventos;



/*descripcion*/
sp_help puestos;
sp_help miembros;
sp_help cuotas;
