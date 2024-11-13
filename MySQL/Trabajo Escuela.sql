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
	AnioCicloBasico int not null,
    ProfesorCicloBasico int not null,
    
    foreign key(ProfesorCicloBasico) references Profesores(IdProfesor)
);

create table CicloBasicoEspecial(
	IdCicloBasicoEspecial int not null primary key,
	MateriaCicloBasicoEspecial varchar(45) not null,
	AnioCicloBasicoEspecial int not null,
    ProfesorCicloBasicoEspecial int not null,
    
     foreign key(ProfesorCicloBasicoEspecial) references Profesores(IdProfesor)
);

create table CicloSuperior(
	IdCicloSuperior int not null primary key,
	MateriaCicloSuperior varchar(45) not null,
	AnoCicloSuperior int not null,
    ProfesorCicloSuperior int not null,
    
    foreign key(ProfesorCicloSuperior) references Profesores(IdProfesor)
);

create table CicloSuperiorEspecial(
	IdCicloSuperiorEspecial int not null primary key,
	MateriaCicloSuperiorEspecial varchar(45) not null,
	AnoCicloSuperiorEspecial int not null,
    ProfesorCicloSuperiorEspecial int not null,
    
    foreign key(ProfesorCicloSuperiorEspecial) references Profesores(IdProfesor)
);

create table Registros(
	TablaAfectada varchar(45),
    Operacion varchar(45),
    IdElemento int,
    Fecha varchar(45)
);

delimiter ///** Dar de alta profesores **/
create procedure INGPROF(id int, nombre varchar(45))
begin
	insert into Profesores values (id, nombre);
end;
//
delimiter // /** Dar de alta Materias para el ciclo basico**/
create procedure INGCB(id int, nombremateria varchar(45), anomateria int, profesormateria int)
begin
	insert into CicloBasico values(id, nombremateria, anomateria, profesormateria);
end//
delimiter ///** Dar de alta Materias para el ciclo basico especial**/
create procedure INGCBE(id int, nombremateria varchar(45), anomateria int, profesormateria int)
begin
	insert into CicloBasicoEspecial values(id, nombremateria, anomateria, profesormateria);
end; //
delimiter ///** Dar de alta Materias para el ciclo superior**/
create procedure INGCS(id int, nombremateria varchar(45), anomateria int, profesormateria int)
begin
	insert into CicloSuperior values(id, nombremateria, anomateria, profesormateria);
end; //
delimiter ///** Dar de alta Materias para el ciclo superior especial**/
create procedure INGCSE(id int, nombremateria varchar(45), anomateria int, profesormateria int)
begin
	insert into CicloSuperiorEspecial values(id, nombremateria, anomateria, profesormateria);
end; //

delimiter ///** Modificar el nombre de los profesores**/
create procedure MODIFPROF(id int, nombre varchar(45))
begin
	update Profesores set NombreProfesor = nombre where IdProfesor = id;
end; //
delimiter // /** Modificar la ID de los profesores**/
create procedure MODIFIDPROF (id int, id2 int)
begin
	update Profesores set IdProfesor = id2 where IdProfesor = id;
end; //

delimiter // /** Modificar la ID de Ciclo Basico**/
create procedure MODIFIDCB (id int, id2 int)
begin
	update CicloBasico set IdCicloBasico = id2 where IdCicloBasico = id;
end; //
delimiter // /** Modificar el nombre de las materias de Ciclo Basico**/
create procedure MODIFNOMBRECB (id int, nombre varchar(45))
begin
	update CicloBasico set MateriaCicloBasico = nombre where IdCicloBasico = id;
end; //
delimiter // /** Modificar el año de las materias de Ciclo Basico**/
create procedure MODIFANOCB (id int, ano int)
begin
	update CicloBasico set AnioCicloBasico = ano where IdCicloBasico = id;
end; //
delimiter // /** Modificar el profesor de la materia de Ciclo Basico**/
create procedure MODIFPROFCB (id int, prof int)
begin
	update CicloBasico set ProfesorCicloBasico = prof where IdCicloBasico = id;
end; //

delimiter // /** Modificar la ID del Ciclo Basico Especial**/
create procedure MODIFIDCBE (id int, id2 int)
begin
	update CicloBasicoEspecial set IdCicloBasicoEspecial = id2 where IdCicloBasicoEspecial = id;
end; //
delimiter // /** Modificar el nombre de la materia de Ciclo Basico Especial**/
create procedure MODIFNOMBRECBE (id int, nombre varchar(45))
begin
	update CicloBasicoEspecial set MateriaCicloBasicoEspecial = nombre where IdCicloBasicoEspecial = id;
end; //
delimiter // /** Modificar el año de las materias de Ciclo Basico Especial**/
create procedure MODIFANOCBE (id int, ano int)
begin
	update CicloBasicoEspecial set AnioCicloBasicoEspecial = ano where IdCicloBasicoEspecial = id;
end; //
delimiter // /**Modificar el profesor de las materias de Ciclo Basico Especial**/
create procedure MODIFPROFCBE (id int, prof int)
begin
	update CicloBasicoEspecial set ProfesorCicloBasicoEspecial = prof where IdCicloBasicoEspecial = id;
end; //

delimiter // /**Modificar la ID de CicloSuperior**/
create procedure MODIFIDCS (id int, id2 int)
begin
	update CicloSuperior set IdCicloSuperior = id2 where IdCicloSuperior = id;
end; //
delimiter // /** Modificar el nombre de la materia de CicloSuperior**/
create procedure MODIFNOMBRECS (id int, nombre varchar(45))
begin
	update CicloSuperior set MateriaCicloSuperior = nombre where IdCicloSuperior = id;
end; //
delimiter // /** Modificar el año de las materias de Ciclo Superior**/
create procedure MODIFANOCS (id int, ano int)
begin
	update CicloSuperior set AnioCicloSuperior = ano where IdCicloSuperior = id;
end; //
delimiter // /** Modificar el profesor de la materia de CicloSuperior**/
create procedure MODIFPROFCS (id int, prof int)
begin
	update CicloSuperior set ProfesorCicloSuperior = prof where IdCicloSuperior = id;
end; //

delimiter // /**Modificar la ID de CicloSuperiorEspecial**/
create procedure MODIFIDCSE (id int, id2 int)
begin
	update CicloSuperiorEspecial set IdCicloSuperiorEspecial = id2 where IdCicloSuperiorEspecial = id;
end; //
delimiter // /** Modificar el nombre de la materia de CicloSuperiorEspecial**/
create procedure MODIFNOMBRECSE (id int, nombre varchar(45))
begin
	update CicloSuperiorEspecial set MateriaCicloSuperiorEspecial = nombre where IdCicloSuperiorEspecial = id;
end; //
delimiter // /**Modificar el año de las materias de CicloSuperiorEspecial**/
create procedure MODIFANOCSE (id int, ano int)
begin
	update CicloSuperiorEspecial set AnioCicloSuperiorEspecial = ano where IdCicloSuperiorEspecial = id;
end; //
delimiter // /** Modificar el profesor de la materia de CicloSuperiorEspecial**/
create procedure MODIFPROFCSE (id int, prof int)
begin
	update CicloSuperiorEspecial set ProfesorCicloSuperiorEspecial = prof where IdCicloSuperiorEspecial = id;
end; //

Delimiter // /**Eliminar un campo de Profesores**/
create procedure ELIMPROF(id int)
begin
	delete from Profesor where IdProfesor =id;
end; //
Delimiter // /**Eliminar un campo de CicloBasico**/
create procedure ELIMCB(id int)
begin
	delete from CicloBasico where IdCicloBasico =id;
end; //
Delimiter // /**Eliminar un campo de CicloBasicoEspeciaL**/
create procedure ELIMCBE(id int)
begin
	delete from CicloBasicoEspecial where CicloBasicoEspecial =id;
end; //
Delimiter // /**Eliminar un campo de CicloSuperior**/
create procedure ELIMCS(id int)
begin
	delete from CicloSuperior where IdCicloSuperior =id;
end; //
Delimiter // /**Eliminar un campo de CicloSuperiorEspecial**/
create procedure ELIMCSE(id int)
begin
	delete from CicloSuperiorEspecial where IdCicloBasicoEspecial =id;
end; //

delimiter // /**Eliminar la tabla Profesores**/
create procedure DROPPROF()
begin
	drop table Profesores;
end; //
delimiter // /**Eliminar la tabla CicloBasico**/
create procedure DROPCB()
begin
	drop table CicloBasico;
end; //
delimiter // /**Eliminar la tabla CicloBasicoEspecial**/
create procedure DROPCBE()
begin
	drop table CicloBasicoEspecial;
end; //
delimiter // /**Eliminar la tabla CicloSuperior**/
create procedure DROPCS()
begin
	drop table CicloSuperior;
end; //

delimiter // /**Eliminar la tabla CicloSuperiorEspecial**/
create procedure DROPCSE()
begin
	drop table CicloSuperiorEspecial;
end; //



-- Triggers echo por Kevin Villanueva --
-- Triggers para CicloBasico --
delimiter //
create trigger after_insert_ciclo_basico
after insert on CicloBasico
for each row
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloBasico', 'INSERT', NEW.IdCicloBasico, NOW());
end; //

delimiter //
create trigger after_update_ciclo_basico
after update on CicloBasico
for each row
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloBasico', 'UPDATE', NEW.IdCicloBasico, NOW());
end; //
 delimiter //
create trigger after_delete_ciclo_basico
after delete on CicloBasico
for each row
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloBasico', 'DELETE', OLD.IdCicloBasico, NOW());
end; //

-- Triggers para CicloBasicoEspecial
delimiter //
create trigger after_insert_ciclo_basico_especial
after insert on CicloBasicoEspecial
for each row
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloBasicoEspecial', 'INSERT', NEW.IdCicloBasicoEspecial, NOW());
 end; //
 
 delimiter //
create trigger after_update_ciclo_basico_especial
after update on CicloBasicoEspecial
for each row
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloBasicoEspecial', 'UPDATE', NEW.IdCicloBasicoEspecial, NOW());
 end;//
 
 delimiter //
create trigger after_delete_ciclo_basico_especial
after delete on CicloBasicoEspecial
for each row
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloBasicoEspecial', 'DELETE', OLD.IdCicloBasicoEspecial, NOW());
 delimiter //

-- Triggers para CicloSuperior
create trigger after_insert_ciclo_superior
after insert on CicloSuperior
for each row
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloSuperior', 'INSERT', NEW.IdCicloSuperior, NOW());
 end;// 
 
 delimiter //
create trigger after_update_ciclo_superior
after update on CicloSuperior
for each row
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloSuperior', 'UPDATE', NEW.IdCicloSuperior, NOW());
end; // 

delimiter //
create trigger after_delete_ciclo_superior
after delete on CicloSuperior
for each row
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloSuperior', 'DELETE', OLD.IdCicloSuperior, NOW());
 end; //
 
-- Triggers para CicloSuperiorEspecial
 delimiter //
create trigger after_insert_ciclo_superior_especial
after insert on CicloSuperiorEspecial
for each row
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloSuperiorEspecial', 'INSERT', NEW.IdCicloSuperiorEspecial, NOW());
end;// 

delimiter //
create trigger after_update_ciclo_superior_especial
after update on CicloSuperiorEspecial
for each row 
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloSuperiorEspecial', 'UPDATE', NEW.IdCicloSuperiorEspecial, NOW());
end; // 

delimiter //
create trigger after_delete_ciclo_superior_especial
after delete on CicloSuperiorEspecial
for each row
begin
insert into Registros (TablaAfectada, Operacion, IdElemento, Fecha)
values ('CicloSuperiorEspecial', 'DELETE', OLD.IdCicloSuperiorEspecial, NOW());
end;//
/**Fecha y hora puesta por Marcos**/

show tables;

-- joins echo por Lucas Alvarez --
-- inner join para la tabla ciclobasico y especial--

select C.MateriaCicloBasico
from CicloBasico C
inner join CicloBasicoEspecial CE 
on C.MateriaCicloBasico = CE.MateriaCicloBasicoEspecial;

Select P.IdProfesor
from Profesores P
Inner Join CicloBasico CE
on P.IdProfesor = CE.ProfesorCicloBasico;

Select P.IdProfesor
from Profesores P
Left Join CicloBasicoEspecial CE
on P.IdProfesor = CE.ProfesorCicloBasicoEspecial;

Select P.IdProfesor
from Profesores P
Left Join CicloSuperior CS
on P.IdProfesor = CS.ProfesorCicloSuperior;

Select P.IdProfesor
from Profesores P
Left Join CicloSuperiorEspecial CS
on P.IdProfesor = CS.ProfesorCicloSuperiorEspecial;

select C.MateriaCicloSuperior
from CicloSuperior C
Right join CicloSuperiorEspecial CE 
on C.MateriaCicloSuperior = CE.MateriaCicloSuperiorEspecial;

select C.MateriaCicloBasico
from CicloBasico C
Right join CicloSuperior CE 
on C.MateriaCicloBasico = CE.MateriaCicloSuperior;