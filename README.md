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

O segundo passo foi converter o modelo conceitual para o modelo lógico. Nesse processo a ferramenta BR Modelo foi bem útil, pois ela disponibiliza uma função própria para isso. 

Pela imagem conseguimos visualizar que as entidades foram transformadas em "tabelas", com as indicações PK para *primary key* e FK para *foreign key*. A única mudança mais substancial foi que a tabela `produto` agora tem um novo atributo que faz referência à chave primária da tabela `categoria`. Por isso, ele é a chave estrangeira. 

De fato, quando temos um relacionamento 1 : N, a chave estrangeira deve ser colocada na lado que tem as múltiplas ocorrências, ou seja, no lado N - que no caso é a tabela `produto`.

### Modelo físico
<img src="https://github.com/alonso-estevam/desafio_1/blob/main/public/desafio1_modelo_fisico.png" />

O terceiro passo foi a modelagem física, já tendo escolhido o PostgreSQL como SGBD. Nesse ponto usei o db diagram, e fui pensando em quais tipos de dados eu usaria para armazenar as informações solicitadas.

Para o campo `codigo`, que será a chave primária, a opção que pareceu melhor foi o `serial`, um "tipo numérico" do Postgres que, segundo a documentação, é "uma conveniência de notação para criar colunas de identificador exclusivo (semelhante à propriedade AUTO_INCREMENT suportada por alguns outros bancos de dados)".

Para o atributo `nome`, que armazenará texto, foi escolhido o `varchar` com limite de 100 caracteres. 

O `valor_unitario`, que vai guardar o preço dos produtos, deve suportar números decimais, então usei o tipo `numeric` com precisão de 6 números e escala de 2 casas decimais após a vírgula (ou seja, pode guardar até 9999,99 - os produtos da nossa simulação não serão mais caros que esse valor). Vale lembrar que a documentação informa que o tipo `numeric` é "especialmente recomendado para armazenar valores monetários e outras quantidades onde a exatidão é necessária".

Por fim, temos o campo `categoria`, que vai armazenar um número inteiro correspondente ao id na tabela das categorias.
