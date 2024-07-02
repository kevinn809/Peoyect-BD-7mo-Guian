drop schema if exists Escuela;
create schema if not exists Escuela ; 
use Escuela;
create table Profesores(
	IdProfesor int not null primary key,
	NombreProfesor varchar(45) not null
	);

create table CicloBasico(
	IdCicloBasico int not null primary key,
	MateriaCicloBasico varchar(45) not null,
	AnioCicloBasico varchar(45) not null,
    ProfesorCicloBasico int not null,
    
    foreign key(ProfesorCicloBasico) references Profesores(IdProfesor)
);

create table CicloBasicoEspecial(
	IdCicloBasicoEspecial int not null primary key,
	MateriaCicloBasicoEspecial varchar(45) not null,
	AnioCicloBasicoEspecial varchar(45) not null,
    ProfesorCicloBasicoEspecial int not null,
    
     foreign key(ProfesorCicloBasicoEspecial) references Profesores(IdProfesor)
);

create table CicloSuperior(
	IdCicloSuperior int not null primary key,
	MateriaCicloSuperior varchar(45) not null,
	AnoCicloSuperior varchar(45) not null,
    ProfesorCicloSuperior int not null,
    
    foreign key(ProfesorCicloSuperior) references Profesores(IdProfesor)
);

create table CicloSuperiorEspecial(
	IdCicloSuperiorEspecial int not null primary key,
	MateriaCicloSuperiorEspecial varchar(45) not null,
	AnoCicloSuperiorEspecial varchar(45) not null,
    ProfesorCicloSuperiorEspecial int not null,
    
    foreign key(ProfesorCicloSuperiorEspecial) references Profesores(IdProfesor)
);

show tables;