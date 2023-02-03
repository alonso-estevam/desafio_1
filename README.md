# Mentoria Digytal Space - Desafio 1

### Requisitos
* criar uma tabela de produtos com os campos `código`, `nome` e `valor unitário` e uma tabela para as categorias dos produtos; 
* inserir registros nas tabelas;
* atualizar o preço dos produtos com acréscimo de 10% sobre o valor original para todas as categorias, com exceção de uma categoria específica;
* atualizar o preço dessa categoria específica em 15%

### Conceitos praticados
* Comandos DDL;
* Comandos DML;
* Comandos DQL

### Ferramentas
* <a href="https://www.brmodeloweb.com/lang/pt-br/index.html">BR Modelo</a>
* <a href="https://dbdiagram.io">dbdiagram</a>
* PostgreSQL v. 13

## Resolução

### Modelo conceitual
<img src="https://github.com/alonso-estevam/desafio_1/blob/main/public/desafio1_modelo_conceitual.png" />

O primeiro passo foi elaborar um modelo conceitual para visualizar melhor o relacionamento entre as tabelas a serem criadas, e para isso eu usei a ferramenta BR Modelo, a versão disponível online. 

Em um ambiente mais complexo, um produto pode pertencer a várias categorias. Porém, para o nosso caso específico, nas "regras de negócio" dessa pequena simulação, um produto pertence a uma única categoria, nem mais, nem menos. Por isso a cardinalidade mínima é 1 e cardinalidade máxima também é 1. 

Por outro lado, uma categoria pode ter um, vários ou nenhum produto associado a ela. Daí a cardinalidade mínima ser 0 (zero) e a cardinalidade máxima ser N. Então esse relacionamento é de 1 : N (lê-se "um para n").

Os atributos estão representados pelas bolinhas com os títulos acima. A bolinha preenchida indica que aquele atributo será a chave primária (*primary key*), ou seja, o identificador único daquela tabela. No caso da entidade `produto`, a chave primária é o atributo `codigo`, enquanto a primary key da entidade `categoria` é o id.

### Modelo lógico
<img src="https://github.com/alonso-estevam/desafio_1/blob/main/public/desafio1_modelo_lógico.png" />

### Modelo físico
<img src="https://github.com/alonso-estevam/desafio_1/blob/main/public/desafio1_modelo_fisico.png" />
