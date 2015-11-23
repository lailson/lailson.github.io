---
layout: post
title: Banco de dados
description: "Banco de dados"
modified: 2015-10-04
category: articles
tags: [banco de dados, mysql ]
image:
  feature: bancodedados/bd.png
  credit: 
  creditlink: 
comments: true
share: true
---

#Banco de dados

###Alterar senha de um usuário
{% highlight mysql %}
update mysql.user set password=PASSWORD('senha') where user='root'; 
FLUSH PRIVILEGES;
{% endhighlight %}

##Linguagens
###DML
Linguagem de Manipulação de Dados: esses comandos indicam uma ação para o SGBD executar. Utilizados para recuperar, inserir e modificar um registro no banco de dados. Seus comandos são: 
<b>INSERT, DELETE, UPDATE, SELECT e LOCK;</b>

###DDL
Linguagem de Definição de dados: comandosDDL são responsáveis pela criação, alteração e exclusão dos objetos no banco de dados. Sao eles: 
<b>CREATE TABLE, CREATE INDEX, ALTER TABLE, DROP TABLE, DROP VIEW e DROP INDEX</b>

###DCL
Controle de acesso dos usuários.
<b>COMMIT, ROLLBACK, GRANT e REVOKE.
</b>

#Criando de manipulando usuário
{% highlight mysql %}
create user usuario@'localhost' identified by 'senha';
{% endhighlight %}

create user : Cria um usuário. <br>
usuário : nome do usuário. <br>
localhost : Host de onde o usuário pode acessar o banco, neste caso é permitido apenas acesso local. Pode ser substituido por '%' para ser acessado de qualquer host. <br>
'senha' : senha do usuário. <br>
Dando permissão:
{% highlight mysql %}
grant all privileges on *.* to usuario@'localhost' with grant option;
{% endhighlight %}
grant : Da permissão. Revoke tira. <br>
all : Todas as tabelas e comandos (select, insert....)<br>
* : Primeiro asterisco indica os bancos de dados, no caso, asterisco indica todos os bancos. <br>
* : Segundo asterisco indica as colunas, no caso do asterisco indica todas as colunas.<br>
Nesse caso esse usuário é parecido com o root pois tem acesso a todos os bancos e todos as tabelas.

#Criando o banco
{% highlight mysql %}
create database comercial;
{% endhighlight %}
Create database : Cria o banco. <br>
comercial : nome do banco.<br>
{% highlight mysql %}
show databases;
{% endhighlight %}
Mostrar todos os bancos de dados.
{% highlight mysql %}
use comercial;
{% endhighlight %}
Utilizar aquele banco de dados.

#Criando as tabelas
{% highlight mysql %}
create table clientes(
                numero int not null auto_increment,
                codigo varchar(10),
                nome varchar(100),
                razao varchar(100),
                data date,
                cnpj varchar(20),
                fone varchar(20),
primary key (numero));
{% endhighlight %}
create table: cria uma tabela.<br>
cliente: Nome da tabela.<br>
numero: nome da coluna. int : Tipo de dados daquela coluna. Not null : Não pode ter dados nulos. Autoincrement: Auto incremento.
{% highlight mysql %}
desc cliente
{% endhighlight %}
Mostra as informações da tabela cliente.

Criando a tabela fornecedor
{% highlight mysql %}
create table fornecedores(
		numero int not null auto_increment,
		codigo varchar(10),
		nome varchar(100),
		razao varchar(100),
		fone varchar(20),
		primary key(numero));
{% endhighlight %}

Criando a tabela vendedores
{% highlight mysql %}
create table vendedores(
		numero int not null auto_increment,
		codigo varchar(10),
		nome varchar(100),
		razao varchar(100),
		fone varchar(20),
		porcent float(10,2),
		primary key (numero));
{% endhighlight %}

Criando a tabela de produtos
{% highlight mysql %}
create table produtos(
		numero int not null auto_increment,
		codigo varchar(20),
		descricao varchar(100),
		valor float(10,2),
		situacao varchar(1),
		fornecedor int,
		primary key (numero));
{% endhighlight %}

Criando a tabela de vendas
{% highlight mysql %}
create table vendas(
		numero int not null auto_increment,
		codigo varchar(10),
		cliente int not null,
		fornecedor int not null,
		vendedor int not null,
		valorvenda float(10,2),
		valordesc float(10,2),
		valortoral float(10,2),
		data date,
		primary key (numero));
{% endhighlight %}

Criando a tabela itens de venda
{% highlight mysql %}
create table itensvendas (
		numero int not null auto_increment,
		numerovenda int not null,
		numeroprod int not null,
		valorivenda float(10,2),
		quantidade int,
		desconto float(10,2),
		primary key (numero));	
{% endhighlight %}

#Integridade do banco de dados
Quando criamos a tabela vendas, nós incluimos colunas de outras tabelas: cliente, fornecedor e produto. Essas colunas estão referenciado um registro em sua tabela origem. Porém, como apenas criamos o campo, nada que informe o banco sobre a referência, devemos fazer isso, passando uma instrução ao nosso SGBD por meio das <i>constraints</i>, como mostra abaixo:

{% highlight mysql %}
alter table vendas add constraint fk_produto_fornecedor
	foreign key(fornecedor)
		references fornecedor(numero)
			on delete no action
			on update no action;
{% endhighlight %}

{% highlight mysql %}
alter table vendas add constraint fk_produto_vendedor
	foreign key(vendedor)
		references vendedores(numero)
			on delete no action
			on update no action;
{% endhighlight %}

TA FALTANDO COISA

#Alterando tabelas
Criando campos de cidade e estados para tabela Clientes.
{% highlight mysql %}
alter table clientes add column cidade varchar(50);
alter table clientes add column estad varchar(50);
{% endhighlight %}
Pronto! Criado as colunas cidade e estado na tabela cliente. Ops! Podemos ver que estado está digitado erradamente (estad). Vamos apagar a coluna e criar corretamente.
{% highlight mysql %}
alter table clientes drop column estad;
alter table clientes add column estado varchar(50);
{% endhighlight %}
Agora esta correto!

#Inserindo registros
Inserindo um cliente
{% highlight mysql %}
insert into clientes(numero,
			codigo,
			nome,
			razao,
			data,
			cnpj,
			fone,
			cidade,
			estado)
		values (1,
			'0001',
			'lailson',
			'Lailson Henrique LTDA',
			'2015-10-05',
			'01.234.567/0001-98',
			'(86)9976-2755',
			'Teresina',
			'PI');
{% endhighlight %}
Se quiser inserir todos os campos da tabela, não é necessário descrever quais os campos serão populados.
{% highlight mysql %}
insert into clientes values (1,
			'0001',
			'lailson',
			'Lailson Henrique LTDA',
			'2015-10-05',
			'01.234.567/0001-98',
			'(86)9976-2755',
			'Teresina',
			'PI');
{% endhighlight %}

#Alterando registro
{% highlight mysql %}
update clientes set nome = 'Lailson Henrique' where numero = 1;
commit;
{% endhighlight %}

{% highlight mysql %}
update clientes set nome = 'Oliveira Santos',
					cidade = 'Timon',
					estado = 'MA'
		where numero = 1;
{% endhighlight %}
{% highlight mysql %}
commit;
{% endhighlight %}
<b>Atenção!!!</b> Ao utilizar o <i>update</i> para alterar um ou mais registros, não se esqueça de usar o where para informar quais registros você deseja mudar. Sem ele, o comando é aplicado a todos os registros da tabela.

#Excluindo registros
Deletando o cliente de número 1
{% highlight mysql %}
delete from clientes
		where numero = 1;

commit;
{% endhighlight %}

Deletando todos os clientes
{% highlight mysql %}
delete from clientes;

commit;
{% endhighlight %}

#Populando o banco
em breve


#Fazendo consultas.
Consultando os clientes:
{% highlight mysql %}
select * from clientes
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/selectclientes.png">
</figure>

Poderiamos selecionar apenas o número o código e a razão, ficaria:
{% highlight mysql %}
select numero, codigo, razao from clientes
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/2.png">
</figure>

Existe situações que queremos selecionar registros específicos, neste caso utilizamos <i>where</i>.
{% highlight mysql %}
select numero, codigo, razao from clientes where codigo = '0001';
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/3.png">
</figure>

Se quisessemos todos os clientes que diferem do código 0001
{% highlight mysql %}
select numero, codigo, razao from clientes where codigo <> '0001';
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/4.png">
</figure>
<b>Obs.:</b> Além dos operadores de comparação = e <>, temos os seguintes:<br>
* >
* <
* >=
* <=
Para compar uma string podemos utilizar o <i>like</i>. Ele também é usado para isso e, excepcionalmente, para quando queremos consultar uma e sé conhecemos uma parte dela.
{% highlight mysql %}
select numero, codigo, nome from clientes where nome like 'L%';
{% endhighlight %}
O símbolo de % (porcento) é um curinga no SQL. Quando não sabemos uma parte da string, podemos utilizá-lo no início, no meio ou no fim dela.
<figure>
    <img src="/images/bancodedados/5.png">
</figure>

Se quisermos saber os clientes que efetuaram uma compra devemos selecionar a coluna cliente na tabela vendas, assim:
{% highlight mysql %}
select cliente from vendas;
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/6.png">
</figure>
De acordo com a imagem a cima veja que aparece clientes repetidos, caso não seja interessante mostrar os clientes repetidos poderiamos usar <b>distinct</b>
{% highlight mysql %}
select distinct cliente from vendas;
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/7.png">
</figure>

Se quisermos consultar na tabela de clientes aqueles que tem os números 1 e 2. A princípio podemos pensar no seguinte código:
{% highlight mysql %}
select numero, razao from clientes where numero = 1,2;
{% endhighlight %}
Mas esse código vai apresentar um erro.
Para solucionar o problema podemos utilizar o <i>in</i>, o código ficaria assim:
{% highlight mysql %}
select numero, razao 
	from clientes 
	where numero in (1,2);
{% endhighlight %}
outra maneira seria assim:
{% highlight mysql %}
select numero, razao from clientes where numero =1 or numero = 2;
{% endhighlight %}

Apesar de apresentarem o mesmo resultado, a forma utilzando o <i>in</i> é mais elegante, e se torna mais sucinta quando passa a ter vários parametros.

Ao contrário do <i>in</i> existe o <i>not in</i>, que mostraria os elementos diferentes, neste caso, podemos selecionar os clientes que tem o codigo diferente de 1 e 2.
{% highlight mysql %}
select numero, razao 
	from clientes 
	where numero not in (1,2);
{% endhighlight %}

Todas as pesquisas anteriores sabiamos qual o código do cliente que queríamos ou não pesquisar, mas agora vamos supor que queremos fazer uma busca que retorne a razão social do cliente que possuem registro na tabela de vendas. Neste caso temos que fazer uma pesquisa dentro da pesquisa, sendo assim, vamos utilzar uma subconsulta, para isto, vamos utilizar o <i>in</i>.
A consulta principal vai retornar a razão social e vai comparar o numero do cliente que será retornado pela subconsulta. 
{% highlight mysql %}
select razao 
		from clientes 
		where numero in 
		(select numero from vendas where numero);
{% endhighlight %}

Com o mesmo raciocínio, vamos buscar os clientes que ainda não fizeram nenhuma venda. Para iso, vamos utilizar <i>not in</i>. 
{% highlight mysql %}
select razao from clientes 
		where numero not in 
		(select numero from vendas where numero);
{% endhighlight %}

Utilizando ALIAS.
Alias são apelidos para os nomes da colunas, podemos ter:
{% highlight mysql %}
select codigo, razao Cliente from clientes;
{% endhighlight %}
Neste caso o apelido da coluna razao será Cliente e será mostrado na imagem, já a coluna codigo não tem apelido e irá mostra seu nome real. Veja:
<figure>
    <img src="/images/bancodedados/8.png">
</figure>
Esta prática é bastante utilizada quando temos colunas com nomes iguais.

Até agora, selecionamos dados de apenas uma tabela. Ao fazer um relatório as informações possivelmente estarão em várias delas. Para fazer uma consulta em mais de uma, nós utilizamos o <b>JOIN</b>. Nos bancos de dados relacionais, ao consultar duas tabelas que possuem alguem relacionamento, você deve especificar de qual tabela são esses campo. Por exemplo, vamos pegar a tabela de vendas e a tabela de clientes, existe uma coluna que é igual entre elas: a chave primária da tabela de cliente e o <i>cliente</i>, com isso temos:
vendas.cliente = cliente.numero
Veja que além de fazer a igualdade entre as colunas, deve-se especificar também à qual tabela pertence o campo.

{% highlight mysql %}
select clientes.codigo, clientes.razao, vendas.codigo 
	from clientes, vendas 
	where vendas.cliente = clientes.numero
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/9.png">
</figure>
Veja que estamos selecionando as colunas codigos e razao da tabela clientes e vendas da tabela codigo. No caso da coluna <i>clientes.codigo</i> indicamos a tabela cliente e a coluna codigo, tem que ser feito assim pois a coluna código existe na duas tabelas, sendo assim, se não colocar o nome da tabela a qual faz referência o sgdb retornará um erro de ambiguidade de colunas. O mesmo acontece para a coluna codigo da tabela de vendas <i>vendas.codigo</i>. No caso da coluna razão <i>clientes.razao</i> não é obrigatório indicar a tabela q qual faz referência pois ela é encontrada apenas na tabela clientes. 

Podemos ordenar as consultas. Para faciliatar a visualização vamos ordernar nossa busca por código do cliente.
{% highlight mysql %}
select clientes.codigo, razao, vendas.codigo from clientes, vendas where vendas.cliente = clientes.numero order by clientes.codigo;
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/10.png">
</figure>

Pois bem, falamos mais a cima que para pegar dados de mais de uma tabela precisamos utilizar o JOIN e a solução mostrada não utiliza o JOIN. 
Sem JOIN
{% highlight mysql %}
select clientes.codigo, clientes.razao, vendas.codigo 
	from clientes, vendas 
	where vendas.cliente = clientes.numero
{% endhighlight %}

Com JOIN
{% highlight mysql %}
select clientes.codigo, clientes.razao, vendas.codigo
    -> from vendas
    -> join clientes
    -> on
    -> vendas.cliente = clientes.numero
    -> order by clientes.razao;
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/11.png">
</figure>
Veja que o resultado apresentado é o mesmo. Apesar de existir discussão sobre a performace da busca, não vamos entrar em detalhes. A sql sem o Join é mais utilizada pois é mais facil de ser entendida, ja com o Join a pesquisa se toda mais complicada/extensa.

#Utilizando consultas com funções
No MySQL, existe várias funções nativas que nos possibilita fazer diversas operações, detre elas: realizar cálculos, manipular strings, trabalhar com datas, realizar operações lógicas, extrar informações do nossos registros, etc. Elas estão divididas nos seguintes tipos:
* Numéricas
* Lógicas
* Manipulação de strings
* Funções de data e horas
Mostraremos as mais utilizadas.

Na pesquisa anterior que fizemos mostramos o codigo do cliente, o nome do cliente e o código das compras que eles fizeram. Agora vamos excluir dessa pesquisa o código da compra. Ficará assim:
{% highlight mysql %}
select clientes.codigo, razao 
    -> from clientes, vendas 
    -> where vendas.cliente = clientes.numero 
    -> order by clientes.codigo;
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/12.png">
</figure>
Podemos observar que o código e o nome/razao do cliente aparece repetido, podemos agrupar para uma melhor visualização para isso utilizaremos o <i>group by</i>.

##Group By
Group by é o comando Sql que faz a operação de agregação. Ele deverá ser utilizado logo após as cláusulas de condição <i>where</i> ou <i>and</i>, e antes de <i>order by</i>.
{% highlight mysql %}
    select clientes.codigo, razao 
    -> from clientes, vendas 
    -> where vendas.cliente = clientes.numero 
    -> group by clientes.codigo, clientes.razao 
    -> order by clientes.codigo;
{% endhighlight %}


