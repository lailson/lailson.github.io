create table clientes(
                numero int not null auto_increment,
                codigo varchar(10),
                nome varchar(100),
                razao varchar(100),
                data date,
                cnpj varchar(20),
                fone varchar(20),
primary key (numero));

create table fornecedores(
         numero int not null auto_increment,
         codigo varchar(10),
         nome varchar(100),
         razao varchar(100),
         fone varchar(20),
         primary key(numero));

create table vendedores(
         numero int not null auto_increment,
         codigo varchar(10),
         nome varchar(100),
         razao varchar(100),
         fone varchar(20),
         porcent float(10,2),
         primary key (numero));

create table produtos(
         numero int not null auto_increment,
         codigo varchar(20),
         descricao varchar(100),
         valor float(10,2),
         situacao varchar(1),
         fornecedor int,
         primary key (numero));

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

create table itensvendas (
         numero int not null auto_increment,
         numerovenda int not null,
         numeroprod int not null,
         valorivenda float(10,2),
         quantidade int,
         desconto float(10,2),
         primary key (numero));         

alter table clientes add column cidade varchar(50);
alter table clientes add column estado varchar(50);


#populando banco
insert into clientes values(	1 	,'0001','AARONSON FURNITURE'   	    ,'AARONSON FURNITURE LTD'	,'2015-02-17 23:14:50',     '17.807.928/0001-85', '(21) 8167-6584' ,'QUEIMADOS'             ,'RJ' );
insert into clientes values(	2   ,'0002','LITTLER '             	    ,'LITTLER  LTDA'        	,'2015-02-17 23:14:50',     '55.643.605/0001-92', '(27) 7990-9502' ,'SERRA'                	,'ES' );
insert into clientes values(	3   ,'0003','KELSEY  NEIGHBOURHOOD'	    ,'KELSEY  NEIGHBOURHOOD' 	,'2015-02-17 23:14:50',     '05.202.361/0001-34', '(11) 4206-9703' ,'BRAGANÇA PAULISTA'    	,'SP' );
insert into clientes values(	4   ,'0004','GREAT AMERICAN MUSIC' 	    ,'GREAT AMERICAN MUSIC'	    ,'2015-02-17 23:14:50',     '11.880.735/0001-73', '(75) 7815-7801' ,'SANTO ANTÔNIO DE JESUS','BA' );
insert into clientes values(	5   ,'0005','LIFE PLAN COUNSELLING'	    ,'LIFE PLAN COUNSELLING' 	,'2015-02-17 23:14:50',     '75.185.467/0001-52', '(17) 4038-9355' ,'BEBEDOURO'            	,'SP' );
insert into clientes values(	6   ,'0006','PRACTI-PLAN'          	    ,'PRACTI-PLAN LTDA'     	,'2015-02-17 23:14:50',     '32.518.106/0001-78', '(28) 2267-6159' ,'CACHOEIRO DE ITAPEMIRI','ES' );
insert into clientes values(	7   ,'0007','SPORTSWEST'           	    ,'SPORTSWEST LTDA'      	,'2015-02-17 23:14:50',     '83.175.645/0001-92', '(61) 4094-7184' ,'TAGUATINGA'           	,'DF' );
insert into clientes values(	8   ,'0008','HUGHES MARKETS'       	    ,'HUGHES MARKETS LTDA'  	,'2015-02-17 23:14:50',     '04.728.160/0001-02', '(21) 7984-9809' ,'RIO DE JANEIRO'       	,'RJ' );
insert into clientes values(	9   ,'0009','AUTO WORKS'           	    ,'AUTO WORKS LTDA'      	,'2015-02-17 23:14:50',     '08.271.985/0001-00', '(21) 8548-5555' ,'RIO DE JANEIRO'       	,'RJ' );
insert into clientes values(	10	,'00010','DAHLKEMPER '          	,'DAHLKEMPER  LTDA'     	,'2015-02-17 23:14:50',  	'49.815.047/0001-00','(11) 4519-7670'  ,'SÃO PAULO'            	,'SP' );

## Inicio popula tabela Vendedores
insert into vendedores values(1,'0001',    'CARLOS FERNANDES','CARLOS FERNANDES LTDA',  '(47) 7535-8144',12  );
insert into vendedores values(2,'0002',    'JÚLIA	GOMES',     'JÚLIA GOMES LTDA',       '(12) 8037-6661',25  );
## Fim popula tabela Vendedores

## Inicio popula tabela Fornecedores
insert into fornecedores values(1 ,'0001',  'DUN RITE LAWN MAINTENANCE'	   ,'DUN RITE LAWN MAINTENANCE LTDA'	,'(85) 7886-8837' );
insert into fornecedores values(2 ,'0002',  'SEWFRO FABRICS'	           ,'SEWFRO FABRICS LTDA'	            ,'(91) 5171-8483' );
## Fim popula tabela Fornecedores


## Inicio popula tabela Produtos
insert into produtos values( 1	,	'123131',     'NOTEBOOK'	,'1251.29'  ,'A',	1  );
insert into produtos values( 2	,	'123223',     'SMARTPHONE','1242.21'  ,'A',	2  );
insert into produtos values( 3	,	'1231',     'DESKTOP'	,'1241.21'  ,'A',	1  );
insert into produtos values( 4	,	'142123',     'TELEVISÃO'	,'2564.92'  ,'A',	2  );
insert into produtos values( 5	,	'7684',     'DRONE'		,'2325.32'  ,'A',	1  );
## Fim popula tabela Produtos


## Inicio popula tabela Vendas
## n_numevenda c_codivenda n_numeclien 	n_numeforne n_numevende n_valovenda	n_descvenda n_totavenda	d_datavenda  
insert into vendas values(1	    ,	'1'	    ,	1	,	1	,	1 ,  '25141.02'  ,	0	,	'25141.02'  ,  '2015-01-01'	 );
insert into vendas values(2	    ,	'2'	    ,	2	,	2	,	2 ,  '12476.58'  ,	0	,	'12476.58'  ,  '2015-01-02'	 );
insert into vendas values(3	    ,	'3'	    ,	3	,	1	,	1 ,  '16257.32'  ,	0	,	'16257.32'  ,  '2015-01-03'	 );
insert into vendas values(4	    ,	'4'	    ,	4	,	2	,	2 ,  '8704.55',	    0	,	'8704.55'   ,  '2015-01-04'	 );
insert into vendas values(5	    ,	'5'	    ,	5	,	1	,	1 ,  '13078.81',	0	,	'13078.81'  ,  '2015-01-01'	 );
insert into vendas values(6	    ,	'6'	    ,	6	,	2	,	2 ,  '6079.19',	    0	,	'6079.19'   ,  '2015-01-02'	 );
insert into vendas values(7	    ,	'7'	    ,	7	,	1	,	1 ,  '7451.26',	    0	,	'7451.26'   ,  '2015-01-03'	 );
insert into vendas values(8	    ,	'8'	    ,	8	,	2	,	2 ,  '15380.47',	0	,	'15380.47'  ,  '2015-01-04'	 );
insert into vendas values(9	    ,	'9'	    ,	9	,	1	,	1 ,  '13508.34',	0	,	'13508.34'  ,  '2015-01-01'	 );
insert into vendas values(10	    ,	'10'	,	1	,	2	,	2 ,  '20315.07',	0	,	'20315.07'  ,  '2015-01-02'	 );
insert into vendas values(11	    ,	'11'	,	1	,	1	,	1 ,  '8704.55',	    0	,	'8704.55'   ,  '2015-01-01'	 );
insert into vendas values(12	    ,	'12'	,	2	,	2	,	2 ,  '11198.05',	0	,	'11198.05'  ,  '2015-01-02'	 );
insert into vendas values(13	    ,	'13'	,	3	,	1	,	1 ,  '4967.84',	    0	,	'4967.84'   ,  '2015-01-03'	 );
insert into vendas values(14	    ,	'14'	,	3	,	2	,	2 ,  '7451.26',	    0	,	'7451.26'   ,  '2015-01-04'	 );
insert into vendas values(15	    ,	'15'	,	5	,	1	,	1 ,  '10747.359',	0	,	'10747.36'  ,  '2015-01-01'	 );
insert into vendas values(16	    ,	'16'	,	6	,	2	,	2 ,  '13502.34',	0	,	'13502.34'  ,  '2015-01-02'	 );
insert into vendas values(17	    ,	'17'	,	7	,	1	,	1 ,  '22222.99',	0	,	'22222.99'  ,  '2015-01-03'	 );
insert into vendas values(18	    ,	'18'	,	8	,	2	,	2 ,  '15465.69',	0	,	'15465.69'  ,  '2015-01-04'	 );
insert into vendas values(19	    ,	'19'	,	9	,	1	,	1 ,  '4650.64',	    0	,	'4650.64'   ,  '2015-01-01'	 );
insert into vendas values(20	    ,	'20'	,	9	,	2	,	2 ,  '6975.96',	    0	,	'6975.96'   ,  '2015-01-02'	 );
## Fim popula tabela Vendas


## Inicio popula tabela Itens Vendas
insert into itensvendas values(1 ,1 ,1,'1251.29',1,0);
insert into itensvendas values(2 ,1 ,2,'1242.21',2,0);
insert into itensvendas values(3 ,1 ,3,'1241.21',3,0);
insert into itensvendas values(4 ,1 ,4,'1513.77',4,0);
insert into itensvendas values(5 ,1 ,5,'2325.32',5,0);
insert into itensvendas values(6 ,2 ,1,'1251.29',6,0);               
insert into itensvendas values(7 ,3 ,3,'1241.21',7,0);               
insert into itensvendas values(8 ,4 ,1,'1251.29',1,0);              
insert into itensvendas values(9 ,5 ,3,'1241.21',2,0);              
insert into itensvendas values(10,6 ,1,'1251.29',3,0);              
insert into itensvendas values(11,7 ,2,'1242.21',4,0);              
insert into itensvendas values(12,8 ,5,'2325.32',5,0);
insert into itensvendas values(13,9 ,2,'1242.21',6,0);
insert into itensvendas values(14,10,3,'1241.21',7,0);
insert into itensvendas values(15,11,1,'1251.29',1,0);
insert into itensvendas values(16,12,1,'1251.29',2,0);
insert into itensvendas values(17,13,2,'1242.21',3,0);
insert into itensvendas values(18,14,2,'1242.21',4,0);
insert into itensvendas values(19,15,3,'1241.21',5,0);
insert into itensvendas values(20,16,3,'1241.21',6,0);
insert into itensvendas values(21 ,17,4,'1513.77',7,0);
insert into itensvendas values(22 ,18,4,'1513.77',1,0);
insert into itensvendas values(23 ,19,5,'2325.32',2,0);
insert into itensvendas values(24 ,20,5,'2325.32',3,0);
insert into itensvendas values(25 ,2 ,2,'1242.21',4,0);
insert into itensvendas values(26 ,3 ,4,'1513.77',5,0);
insert into itensvendas values(27 ,4 ,2,'1242.21',6,0);
insert into itensvendas values(28 ,5 ,4,'1513.77',7,0);
insert into itensvendas values(29 ,6 ,5,'2325.32',1,0);
insert into itensvendas values(30,7 ,3,'1241.21',2,0);
insert into itensvendas values(31,8 ,1,'1251.29',3,0);
insert into itensvendas values(32,9 ,4,'1513.77',4,0);
insert into itensvendas values(33,10,5,'2325.32',5,0);
insert into itensvendas values(34,11,2,'1242.21',6,0);
insert into itensvendas values(35,12,2,'1242.21',7,0);
insert into itensvendas values(36,13,3,'1241.21',1,0);
insert into itensvendas values(37,14,3,'1241.21',2,0);
insert into itensvendas values(38,15,4,'1513.77',3,0);
insert into itensvendas values(39,16,4,'1513.77',4,0);
insert into itensvendas values(40,17,5,'2325.32',5,0);
insert into itensvendas values(41,18,5,'2325.32',6,0);
## Fim popula tabela  Itens Vendas


