

DROP TABLE tb_cli_desconto CASCADE CONSTRAINTS;

DROP TABLE tb_cliente CASCADE CONSTRAINTS;

DROP TABLE tb_medicamento CASCADE CONSTRAINTS;

DROP TABLE tb_pedido CASCADE CONSTRAINTS;

DROP TABLE tb_plano_saude CASCADE CONSTRAINTS;


CREATE TABLE tb_cli_desconto (
    id_cliente     INTEGER NOT NULL,
    id_plano_saude INTEGER NOT NULL
);

CREATE TABLE tb_cliente (
    id_cliente       INTEGER NOT NULL,
    nome_cliente     VARCHAR2(100),
    telefone_cliente INTEGER,
    email_cliente    VARCHAR2(100),
    endereco_cliente VARCHAR2(100)
);

ALTER TABLE tb_cliente ADD CONSTRAINT id_cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE tb_medicamento (
    id_medicamento    INTEGER NOT NULL,
    nome_medicamento  VARCHAR2(100),
    preco_medicamento NUMBER(10, 2),
    bula_medicamento  VARCHAR2(4000),
    categoria         VARCHAR2(100)
);

ALTER TABLE tb_medicamento ADD CONSTRAINT id_medicamento_pk PRIMARY KEY ( id_medicamento );

CREATE TABLE tb_pedido (
    id_cliente       INTEGER NOT NULL,
    id_medicamento   INTEGER NOT NULL,
    qtde_medicamento INTEGER,
    data             TIMESTAMP
);

CREATE TABLE tb_plano_saude (
    id_plano_saude           INTEGER NOT NULL,
    nome_plano_saude         VARCHAR2(100),
    cod_carteirinha          INTEGER,
    desconto_plano_saude_pct INTEGER
);

ALTER TABLE tb_plano_saude ADD CONSTRAINT id_plano_saude_pk PRIMARY KEY ( id_plano_saude );

ALTER TABLE tb_cli_desconto
    ADD CONSTRAINT tb_cli_desconto_id_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES tb_cliente ( id_cliente );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE tb_cli_desconto
    ADD CONSTRAINT tb_cli_desconto_id_plano_saude_fk FOREIGN KEY ( id_plano_saude )
        REFERENCES tb_plano_saude ( id_plano_saude );

ALTER TABLE tb_pedido
    ADD CONSTRAINT tb_pedido_id_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES tb_cliente ( id_cliente );

ALTER TABLE tb_pedido
    ADD CONSTRAINT tb_pedido_tb_medicamento_fk FOREIGN KEY ( id_medicamento )
        REFERENCES tb_medicamento ( id_medicamento );

        
        
        
       
insert into tb_cliente values (1,'Aline',988881111,'aline@fiap.com.br','Rua 1');
insert into tb_cliente values (2,'Bia',988882222,'bia@fiap.com.br','Rua 2');
insert into tb_cliente values (3,'Carol',988883333,'carol@fiap.com.br','Rua 3');
insert into tb_cliente values (4,'Dani',988884444,'dani@fiap.com.br','Rua 4');
insert into tb_cliente values (5,'Eliana',988885555,'eliana@fiap.com.br','Rua 5');
insert into tb_cliente values (6,'Alan',988881116,'alan@fiap.com.br','Rua 1');
insert into tb_cliente values (7,'Pedro',988882227,'pedro@fiap.com.br','Rua 2');
insert into tb_cliente values (8,'Antonio',988883338,'antonio@fiap.com.br','Rua 3');
insert into tb_cliente values (9,'Isac',988884449,'isac@fiap.com.br','Rua 4');
insert into tb_cliente values (10,'Paulo',988885599,'paulo@fiap.com.br','Rua 5');
insert into tb_cliente values (11,'Poliana',988885511,'poli@fiap.com.br','Rua 5');
insert into tb_cliente values (12,'Zeni',988885512,'zeni@fiap.com.br','Rua 5');

insert into tb_medicamento values (10,'Anador',11.50,'Remedio para Gripe A','Gripes e Resfriados');
insert into tb_medicamento values (20,'Benegripe',22.50,'Remedio para Gripe B','Gripes e Resfriados');
insert into tb_medicamento values (30,'Camomilina C',33.50,'Remedio para Gripe C','Gripes e Resfriados');
insert into tb_medicamento values (40,'Dipirona',44.50,'Remedio para Gripe D','Gripes e Resfriados');

insert into tb_medicamento values (100,'Estomazil',55.50,'Remedio para Estomago','Gastrointestinais');
insert into tb_medicamento values (200,'Prolive',134.60,'Remedio para Flora Intestinal','Gastrointestinais');
insert into tb_medicamento values (300,'Lacday',54.90,'Enzima digestiva-Lactase','Gastrointestinais');
insert into tb_medicamento values (400,'Epocler C',3.00,'Remedio para Estomago','Gastrointestinais');

insert into tb_medicamento values (1000,'Tamarine',81.09,'Tratamento sintomático de intestino preso','Fitoterapicos');
insert into tb_medicamento values (2000,'Cha Ultra Margo',22.88,'SUPLEMENTO A BASE DE COLINA E VITAMINAS B1 E B6','Fitoterapicos');
insert into tb_medicamento values (3000,'Novanoite',33.44,'Tratamento da ansiedade leve','Fitoterapicos');

insert into tb_medicamento values (10000,'Loratamed',6.90,'Tratamento rinite alérgica','Alergias');
insert into tb_medicamento values (20000,'Histamin',5.90,'O Histamin é destinado para alergias, prurido, rinite alérgica, urticaria, picada de inseto, conjuntivite alergica, dermatite atopica (um tipo de inflamacao na pele) e eczemas alérgicos (dermatite)','Alergias');
insert into tb_medicamento values (30000,'Allegra',100.85,'Para o alivio das manifestacoes alergicas','Alergias');

insert into tb_medicamento values (1,'Novalgina',20.15,'Para dor de Cabeca','Gripes e Resfriados');
insert into tb_medicamento values (2,'Floratil',36.85,'Remedio para Flora Intestinal','Gastrointestinais');


insert into tb_pedido values (1,10,1,TO_TIMESTAMP('28-10-2022 23:40:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (1,100,3,TO_TIMESTAMP('12-10-2022 22:45:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (2,1000,2,TO_TIMESTAMP('15-10-2022 23:50:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (2,10000,2,TO_TIMESTAMP('15-10-2022 23:50:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (3,20,11,TO_TIMESTAMP('11-10-2022 23:55:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (3,200,3,TO_TIMESTAMP('10-10-2022 22:10:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (3,2000,4,TO_TIMESTAMP('24-10-2022 23:15:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (4,20000,6,TO_TIMESTAMP('23-10-2022 22:20:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (4,30,8,TO_TIMESTAMP('22-10-2022 19:23:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (5,300,2,TO_TIMESTAMP('21-10-2022 20:23:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (5,3000,7,TO_TIMESTAMP('20-10-2022 19:48:00','DD-MM-YYYY HH24:MI:SS'));

insert into tb_pedido values (6,30000,8,TO_TIMESTAMP('28-11-2022 23:40:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (6,40,23,TO_TIMESTAMP('12-11-2022 22:45:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (6,400,25,TO_TIMESTAMP('15-11-2022 23:50:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (7,40,1,TO_TIMESTAMP('11-11-2022 23:55:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (7,400,23,TO_TIMESTAMP('10-11-2022 22:10:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (7,40,44,TO_TIMESTAMP('24-11-2022 23:15:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (8,400,36,TO_TIMESTAMP('23-11-2022 22:20:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (8,100,28,TO_TIMESTAMP('22-11-2022 19:23:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (8,200,12,TO_TIMESTAMP('21-11-2022 20:23:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (9,300,27,TO_TIMESTAMP('20-11-2022 19:48:00','DD-MM-YYYY HH24:MI:SS'));

insert into tb_pedido values (9,400,8,TO_TIMESTAMP('28-05-2021 23:40:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (9,1000,12,TO_TIMESTAMP('12-05-2021 22:45:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (10,2000,16,TO_TIMESTAMP('15-05-2021 23:50:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (10,3000,14,TO_TIMESTAMP('11-04-2021 23:55:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (10,10000,36,TO_TIMESTAMP('10-03-2021 22:10:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (10,20000,30,TO_TIMESTAMP('24-07-2021 23:15:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (1,30000,22,TO_TIMESTAMP('23-07-2021 22:20:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (2,10,21,TO_TIMESTAMP('22-09-2021 19:23:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (3,200,12,TO_TIMESTAMP('21-12-2021 20:23:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (4,400,17,TO_TIMESTAMP('20-11-2021 19:48:00','DD-MM-YYYY HH24:MI:SS'));

insert into tb_pedido values (5,300,1,TO_TIMESTAMP('28-05-2020 23:40:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (6,30,11,TO_TIMESTAMP('12-05-2020 22:45:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (7,200,22,TO_TIMESTAMP('15-05-2020 23:50:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (8,40,13,TO_TIMESTAMP('11-04-2020 23:55:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (9,30,16,TO_TIMESTAMP('10-03-2020 22:10:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (10,100,14,TO_TIMESTAMP('24-07-2020 23:15:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (1,200,26,TO_TIMESTAMP('23-07-2020 22:20:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (2,2000,19,TO_TIMESTAMP('22-09-2020 19:23:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (3,20000,5,TO_TIMESTAMP('21-12-2020 20:23:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (4,300,21,TO_TIMESTAMP('20-11-2020 19:48:00','DD-MM-YYYY HH24:MI:SS'));

insert into tb_pedido values (1,30000,2,TO_TIMESTAMP('28-02-2019 23:40:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (1,30000,4,TO_TIMESTAMP('12-01-2019 22:45:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (2,40,5,TO_TIMESTAMP('15-06-2019 23:50:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (3,400,8,TO_TIMESTAMP('11-05-2019 23:55:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (3,30,9,TO_TIMESTAMP('10-12-2019 22:10:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (3,300,26,TO_TIMESTAMP('24-12-2019 23:15:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (4,10,13,TO_TIMESTAMP('23-04-2019 22:20:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (4,20,11,TO_TIMESTAMP('22-04-2019 19:23:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (5,30,18,TO_TIMESTAMP('21-02-2019 20:23:00','DD-MM-YYYY HH24:MI:SS'));
insert into tb_pedido values (1,40,4,TO_TIMESTAMP('20-07-2019 19:48:00','DD-MM-YYYY HH24:MI:SS'));

--select * from tb_pedido

insert into tb_plano_saude values (1001,'Amil',1111,5);
insert into tb_plano_saude values (1002,'Bradesco',2222,10);
insert into tb_plano_saude values (1003,'SulAmerica',3333,15);
insert into tb_plano_saude values (1004,'Unimed',4444,8);


insert into tb_cli_desconto values (1,1002);
insert into tb_cli_desconto values (2,1003);
insert into tb_cli_desconto values (3,1002);
insert into tb_cli_desconto values (4,1001);
insert into tb_cli_desconto values (5,1003);
insert into tb_cli_desconto values (6,1002);
insert into tb_cli_desconto values (7,1003);
insert into tb_cli_desconto values (8,1002);
insert into tb_cli_desconto values (9,1001);
insert into tb_cli_desconto values (10,1002);



commit;        






-- Quantidade total de pedidos por cliente
select cli.nome_cliente, count(ped.id_cliente) as quantidade
from tb_cliente cli inner join tb_pedido ped
on cli.id_cliente = ped.id_cliente
group by nome_cliente;

-- Quantidade de medicamentos comprado por cliente no ano de 2022
select cli.nome_cliente, sum(ped.qtde_medicamento) as quantidade
from tb_cliente cli inner join tb_pedido ped
on cli.id_cliente = ped.id_cliente
where extract (year from data) = 2022
group by nome_cliente;

-- Quantidade de pedidos por ano ordenando por ano do menor para o maior 
select extract(year from data) as ano, count(ped.id_cliente) as quantidade
from tb_cliente cli inner join tb_pedido ped
on cli.id_cliente = ped.id_cliente
group by extract( year from data)
order by ano asc;

-- Total gasto por cliente 
select cli.nome_cliente, sum(ped.qtde_medicamento * med.preco_medicamento) as total_gasto
from tb_cliente cli inner join tb_pedido ped
on cli.id_cliente = ped.id_cliente
inner join tb_medicamento med
on ped.id_medicamento = med.id_medicamento  
group by nome_cliente;

-- Toatl gasto por cliente em 2021
select cli.nome_cliente, sum(ped.qtde_medicamento * med.preco_medicamento) as total_gasto
from tb_cliente cli inner join tb_pedido ped
on cli.id_cliente = ped.id_cliente
inner join tb_medicamento med
on ped.id_medicamento = med.id_medicamento  
where extract (year from data) = 2021
group by nome_cliente;  

-- Lista de clientes que nunca compraram 
select cli.nome_cliente, count(ped.id_cliente) as quantidade
from tb_cliente cli left join tb_pedido ped
on cli.id_cliente = ped.id_cliente
WHERE PED.ID_CLIENTE IS NULL
group by nome_cliente;

-- Top 3 medicamentos mais vendidos 
select med.nome_medicamento, count(ped.id_medicamento) as quantidade
from tb_medicamento med inner join tb_pedido ped
on med.id_medicamento = ped.id_medicamento
group by nome_medicamento
order by quantidade desc
fetch first 3 rows only;

-- Clientes sem plano de saúde 
select cli.nome_cliente, count(cd.id_cliente) as quantidade
from tb_cliente cli left join tb_cli_desconto cd
on cli.id_cliente = cd.id_cliente
WHERE cd.ID_CLIENTE IS NULL
group by nome_cliente;

-- Categoria de medicamento com preço médio maior que 30
select categoria, avg(preco_medicamento) as media
from tb_medicamento
group by categoria 
having avg(preco_medicamento) > 30;

-- Clientes que compraram mais de 60 unidades de um medicamento
SELECT
    cli.nome_cliente,
    SUM(ped.qtde_medicamento) AS total_unidades_compradas
FROM
    tb_cliente cli
INNER JOIN
    tb_pedido ped ON cli.id_cliente = ped.id_cliente 
GROUP BY
    cli.nome_cliente                                
HAVING
    SUM(ped.qtde_medicamento) > 60;                  


