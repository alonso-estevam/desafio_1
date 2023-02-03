CREATE TABLE tb_categorias (
  id serial PRIMARY KEY,
  nome varchar(80) NOT NULL
);


CREATE TABLE tb_produtos (
  codigo serial PRIMARY KEY,
  nome varchar(100) NOT NULL,
  valor_unitario numeric(6,2),
  categoria int NOT NULL REFERENCES tb_categorias (id)
);


INSERT INTO tb_categorias (nome)
VALUES	('outros'),
	('eletrodomesticos'),
	('eletronicos'),
	('papelaria'),
	('livros');


INSERT INTO tb_produtos (nome, valor_unitario, categoria)
VALUES	('Livro "Head First: Java"', 74.89, 5),
	('Livro "Projeto de Banco de Dados"', 59.49, 5),
	('Ventilador Arno', 189.90, 2),
	('Fogão Esmaltec', 559.00, 2),
	('Liquidificador Turbo', 75.99, 2),
	('Console Super Mini SFC', 99.80, 3),
	('Fone de Ouvido Headset com Microfone', 84.10, 3),
	('Conjunto Pincel Marcador de Texto', 13.90, 4),
	('Bloco Adesivo Smart Notes', 21.42, 4),
	('Papel Sulfite Chamex A4, 75g', 19.80, 4),
	('Caneta Esferográfica Colorida', 4.50, 4);


UPDATE tb_produtos SET valor_unitario = valor_unitario + (valor_unitario * 0.1) WHERE categoria <> 4;


UPDATE tb_produtos SET valor_unitario = valor_unitario + (valor_unitario * 0.15) WHERE categoria = 4;
