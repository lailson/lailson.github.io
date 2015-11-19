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
    <img src="/images/bancodedados/02.png">
</figure>

Existe situações que queremos selecionar registros específicos, neste caso utilizamos <i>where</i>.
{% highlight mysql %}
select numero, codigo, razao from clientes where codigo = '0001';
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/03.png">
</figure>

Se quisessemos todos os clientes que diferem do código 0001
{% highlight mysql %}
select numero, codigo, razao from clientes where codigo <> '0001';
{% endhighlight %}
<figure>
    <img src="/images/bancodedados/04.png">
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
<figure>
    <img src="/images/bancodedados/05.png">
</figure>
