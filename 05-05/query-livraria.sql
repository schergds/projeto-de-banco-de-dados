create database livraria;
use livraria;
create table Cliente(
	idCliente int auto_increment,
    tipo varchar(20) not null,
    cpf varchar(14),
    cnpj varchar(18),
    cep varchar(9) not null,
    primary key (idCliente)
);

create table Transportadora(
	idTransportadora int auto_increment,
    nome varchar(45) not null,
    cnpj varchar(18) not null,
    cep varchar(8) not null,
    primary key (idTransportadora)
);

insert into Transportadora(nome, cnpj, cep)
values('transguido', 123444, 9123);

create table Editor(
	idEditor int auto_increment,
    nome varchar(100) not null,
    cnpj varchar(18) not null,
    cidade varchar(45) not null,
    pais varchar(45) not null,
    primary key (idEditor)
);

insert into Editor(nome, cnpj, cidade, pais)
values('saraiva', 1236, 'sao gabriel', 'brasil');

update Editor
set nome = 'editoraupdate'
where idEditor = 2;

create table Categoria(
	idCategoria int auto_increment,
    descricao varchar(500) not null,
    titulo varchar(100) not null,
    primary key (idCategoria)
);

insert into Categoria(descricao, titulo)
values('muito bom livro sobre o udyr', 'udyr');

create table Autor(
	idAutor int auto_increment,
    nome varchar(150) not null,
    nacionalidade varchar(40) not null,
    biografia varchar(500),
    primary key (idAutor)
);

insert into Autor(nome, nacionalidade, biografia)
values('zamba', 'brasileiro', 'prof mestre');

create table Livro(
	idLivro int auto_increment,
    titulo varchar(150) not null,
    descritivo varchar(1000) not null,
    ano DATE not null,
    preco decimal not null,
    EditorId int,
    primary key (idLivro),
    foreign key (EditorId) references Editor(idEditor) on delete restrict
);

insert into Livro(titulo, descritivo, ano, preco, EditorId)
values('capitao cueca', 'livrao massa', '2025-05-05', 100.50, 1);

create table Venda(
	ClienteId int,
    LivroId int,
    numeroNotaFiscal varchar(45),
    date DATETIME not null,
    valorTotal float not null,
    primary key (numeroNotaFiscal),
    foreign key (ClienteId) references Cliente(idCliente) on delete restrict,
    foreign key (LivroId) references Livro(idLivro) on delete restrict
);

insert into Venda(ClienteId, LivroId, numeroNotaFiscal, date, valorTotal)
values(1, 1, '123', '2025-05-05 15:30:00', 1000);

create table Entrega(
	NotaFiscal varchar(45),
    TransportadoraId int,
    numeroProtocolo int,
    primary key (numeroProtocolo),
    foreign key (NotaFiscal) references Venda(numeroNotaFiscal) on delete restrict,
    foreign key (TransportadoraId) references Transportadora(idTransportadora) on delete restrict
);

insert into Entrega(NotaFiscal, TransportadoraId, numeroProtocolo, meioEntrega)
values('123', 1, 98765, 3);

create table Livro_has_Categoria(
	Livro_idLivro int,
    Categoria_idCategoria int,
    foreign key (Livro_idLivro) references Livro(idLivro) on delete restrict,
    foreign key (Categoria_idCategoria) references Categoria(idCategoria) on delete restrict
);

insert into Livro_has_Categoria(Livro_idLivro, Categoria_idCategoria)
values(1, 1);

create table Livro_has_Autor(
	Livro_idLivro int,
    Autor_idAutor int,
    idLivroAutor int,
    primary key (idLivroAutor),
    foreign key (Livro_idLivro) references Livro(idLivro) on delete restrict,
    foreign key (Autor_idAutor) references Autor(idAutor) on delete restrict
);