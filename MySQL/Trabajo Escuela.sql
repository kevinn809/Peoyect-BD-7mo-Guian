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


-- Triggers echo por Kevin Villanueva
-- Triggers para CicloBasico
create trigger after_insert_ciclo_basico
after insert on CicloBasico
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloBasico', 'INSERT', NEW.IdCicloBasico);

create trigger after_update_ciclo_basico
after update on CicloBasico
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloBasico', 'UPDATE', NEW.IdCicloBasico);

create trigger after_delete_ciclo_basico
after delete on CicloBasico
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloBasico', 'DELETE', OLD.IdCicloBasico);

-- Triggers para CicloBasicoEspecial
create trigger after_insert_ciclo_basico_especial
after insert on CicloBasicoEspecial
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloBasicoEspecial', 'INSERT', NEW.IdCicloBasicoEspecial);

create trigger after_update_ciclo_basico_especial
after update on CicloBasicoEspecial
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloBasicoEspecial', 'UPDATE', NEW.IdCicloBasicoEspecial);

create trigger after_delete_ciclo_basico_especial
after delete on CicloBasicoEspecial
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloBasicoEspecial', 'DELETE', OLD.IdCicloBasicoEspecial);

-- Triggers para CicloSuperior
create trigger after_insert_ciclo_superior
after insert on CicloSuperior
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloSuperior', 'INSERT', NEW.IdCicloSuperior);

create trigger after_update_ciclo_superior
after update on CicloSuperior
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloSuperior', 'UPDATE', NEW.IdCicloSuperior);

create trigger after_delete_ciclo_superior
after delete on CicloSuperior
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloSuperior', 'DELETE', OLD.IdCicloSuperior);

-- Triggers para CicloSuperiorEspecial
create trigger after_insert_ciclo_superior_especial
after insert on CicloSuperiorEspecial
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloSuperiorEspecial', 'INSERT', NEW.IdCicloSuperiorEspecial);

create trigger after_update_ciclo_superior_especial
after update on CicloSuperiorEspecial
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloSuperiorEspecial', 'UPDATE', NEW.IdCicloSuperiorEspecial);

create trigger after_delete_ciclo_superior_especial
after delete on CicloSuperiorEspecial
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento)
values ('CicloSuperiorEspecial', 'DELETE', OLD.IdCicloSuperiorEspecial);


show tables;