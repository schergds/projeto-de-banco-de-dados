-- Conta quantas tuplas/linhas há na tabela Ranking_Semanal
select count(*)
from ranking_semanal;

-- i.Mostre todos os autores cadastrados; 
select *
from autor;

-- ii.Mostre apenas os nomes dos autores;
select autor.nome
from autor;

-- iii.Mostre o nome e a identificação do autor, nesta ordem;
select nome, idautor
from autor;

-- iv.Mostre o nome dos autores que aparecem na tabela Livro_Autor;
select autor.nome
from autor, livro_autor
where autor.idautor = livro_autor.idautor;

-- v.Mostre o nome dos autores, sem repetição, presentes na tabela Livro_Autor; 
select distinct(autor.nome)
from autor, livro_autor
where autor.idautor = livro_autor.idautor;

-- vi.Mostre os autores em ordem alfabética;
select nome
from autor
order by nome;

-- vii.Mostre o título dos livros que são da editora Rocco ou da editora Scipione; 
select distinct(livro.titulo)
from livro, editora
where livro.ideditora = editora.ideditora and (editora.nome = "Rocco" or editora.nome = "Scipione");

-- viii.Mostre, em ordem alfabética, os autores que começam com M;
select nome
from autor
where nome like "M%"
order by nome;

-- ix.Mostre, em ordem alfabética, os autores que começam com L;
select nome
from autor
where nome like "L%"
order by nome;

-- x.Mostre, em ordem alfabética, os autores que NÃO começam com L; 
select nome
from autor
where nome not like "L%"
order by nome;

-- xi.Mostre, em qualquer ordem, os autores que não começam com M;
select nome
from autor
where nome not like "M%";

-- xii.Liste apenas os livros das editoras 1 OU 5;
select livro.*
from livro, editora
where livro.ideditora = editora.ideditora and (editora.ideditora = 1 or editora.ideditora = 5);

-- xiii.Mostre os livros infantis das editoras 1 e 5;
select livro.*
from livro, editora, genero
where livro.ideditora = editora.ideditora and (editora.ideditora = 1 or editora.ideditora = 5) and livro.idgenero = genero.idgenero and genero.descricao = "Infantil";

-- xiv.Mostre os códigos e os títulos dos livros, com seus respectivos preços;
select idlivro, titulo, preco
from livro;

-- xv.Mostre os autores em ordem contrária à alfabética;
select nome
from autor
order by nome desc;

-- xvi.Liste os livros, na ordem de preços do mais caro ao mais barato; 
select *
from livro
order by preco desc;

-- xvii.Liste os livros, na ordem de preços do mais barato ao mais caro;
select *
from livro
order by preco asc;

-- xviii.Mostre apenas os livros de auto-ajuda, na ordem crescente de preço; 
select livro.*
from livro, genero
where livro.idgenero = genero.idgenero and genero.descricao = "Auto-Ajuda"
order by preco asc;

-- xix.Mostre quantos autores estão cadastros;
select count(*)
from autor;

-- xx.Mostre os preços dos livros mais baratos e mais caros da editora 1; 
select max(livro.preco), min(livro.preco)
from livro, editora
where livro.ideditora = editora.ideditora and editora.ideditora = 1;

-- xxi.Liste a média de preços dos livros da editora 2;
select avg(livro.preco)
from livro, editora
where livro.ideditora = editora.ideditora and editora.ideditora = 2;

-- xxii.Mostre os livros com seus respectivos nomes de editoras e gêneros;
select livro.titulo as livro, editora.nome as editora, genero.descricao as genero
from livro, editora, genero
where livro.ideditora = editora.ideditora and livro.idgenero = genero.idgenero;

-- xxiii.Liste os livros, mostrando o titulo de cada um bem como o nome do autor;
select livro.titulo as livro, autor.nome as autor
from livro, autor, livro_autor
where livro.idlivro = livro_autor.idlivro and autor.idautor = livro_autor.idautor;

-- xxiv.Mostre o título do livro que ficou o maior número de semanas consecutivas em 1o lugar;
select livro.titulo
from livro, ranking_semanal
where livro.idlivro = ranking_semanal.idlivro and ranking_semanal.semanasConsecutivas = (select max(ranking_semanal.semanasConsecutivas)
																						 from ranking_semanal
																						 where posicao = 1);
                                                                                         
-- xxv.Mostre o nome dos autores dos livros que estavam no ranking da semana de 24/08/2003 a 30/08/2003;
select distinct(autor.nome)
from autor, livro, livro_autor, ranking, ranking_semanal
where (livro.idlivro = livro_autor.idlivro and autor.idautor = livro_autor.idautor) 
										   and livro.idlivro = ranking_semanal.idlivro 
                                           and ranking.idranking = ranking_semanal.idranking 
                                           and ranking.datainicial = "2003-08-24" 
                                           and ranking.datafinal = "2003-08-30";