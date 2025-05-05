use livraria;

alter table Autor
add nomeFantasia varchar(100);

alter table Entrega
add meioEntrega int not null;

alter table Autor
modify column biografia varchar(1000);