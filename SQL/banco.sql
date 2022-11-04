drop database if exists bank;
create database if not exists bank;

use bank;

create table if not exists endereco(
idendereco int(3) primary key auto_increment,
estado varchar(2),
cidade varchar(30),
bairro varchar(30),
rua varchar(30),
numero int (5)
);

create table if not exists proprietario(
idproprietario int(3) primary key auto_increment,
nome varchar(30) not null,
email varchar(30) unique,
id_endereco int(5) not null,
nascimento varchar(10) not null,
foreign key(id_endereco) references endereco(idendereco)
);

create table if not exists gerente(
idgerente int(3) primary key auto_increment,
nome varchar(30) not null,
salario float(9,2) not null,
id_endereco int(5) not null,
foreign key (id_endereco) references endereco(idendereco)
);

create table if not exists conta(
idconta int(3) primary key auto_increment,
senha varchar(6) not null,
saldo float(8,2) not null,
datadecriacao varchar(10) not null,
id_proprietario int(3) unique,
id_gerente int(3),
foreign key (id_proprietario) references proprietario(idproprietario),
foreign key (id_gerente) references gerente(idgerente)
);

create table if not exists agencia(
idagencia int(3) primary key auto_increment,
id_conta int(3) unique not null,
id_endereco int(5) not null,
foreign key (id_conta) references conta(idconta),
foreign key(id_endereco) references endereco(idendereco)
);

create table if not exists banco(
id_agencia int(3) unique not null,
nome varchar(10),
foreign key(id_agencia) references agencia(idagencia)
);

insert into endereco values(null,'SP','São Paulo','Chácara Santantão', 'Do Mario', 42);
insert into endereco values(null,'SP','São Paulo','Santo Amaro', 'Berzequio', 100);
insert into endereco values(null,'SP','São Bernardo do Campo', 'Sabe-se deus','Rua qualquer', 69);
insert into endereco values(null,'SP','São Bernardo do Campo', 'PQ. dos passaros','Avenida das Aráras', 1100);
insert into endereco values(null,'SP','São Paulo', 'Interlargos','Rua dos atrasados', 404);
insert into endereco values(null,'SP','São Paulo', 'Sabe-se lá','PQP', 404);

insert into proprietario values(null, 'Tiago Fernandes Ribeiro', 'tiago.fribeiro@senacsp.edu.br', 4, '15/02/2002');
insert into proprietario values(null, 'Rafaela Gomes', 'RafaGamaral@meucoracao.com', 1, '10/01/2002');
insert into proprietario values(null, 'Marcelo Rodrigues', 'Marcelin@senacsp.edu.br', 5, '00/00/1999');
insert into proprietario values(null, 'Rafaela Martin', 'rafamartins@senacsp.edu.br', 6, '00/00/2003');

insert into gerente values(null, 'Roger o Gerente', 1000.00, 2);
insert into gerente values(null, 'DJ Pereira Funk', 100000.00, 3);

insert into conta values(null,'000000',50000.00,'27/10/2022',1,1);
insert into conta values(null,'000001', 10000.00, '01/11/2022',2,2);
insert into conta values(null,'000002', 55.00, '01/11/2022',3,2);
insert into conta values(null,'000003', 110.00, '03/11/2022',4,1);

insert into agencia values(null,1,3);

insert into banco values(1,'Java Bank');

create view relatorio as
select c.idconta as 'id da conta', 
p.nome as 'proprietario da conta',
p.idproprietario as 'id do proprietario', 
p.email as 'endereço de e-mail', 
p.nascimento as 'data de nascimento', 
e.estado, 
e.bairro, 
e.rua, 
e.numero, 
g.nome as 'gerente da conta',
g.idgerente as 'id do gerente', 
c.saldo as 'saldo atual', 
c.datadecriacao as 'data de criação', 
a.idagencia as 'id da agencia', 
b.nome as banco
from proprietario p
inner join endereco e 
on p.id_endereco = e.idendereco
inner join conta c
on c.id_proprietario = p.idproprietario
inner join gerente g
on c.id_gerente = g.idgerente
inner join agencia a
inner join banco b
order by c.idconta;

select * from relatorio;