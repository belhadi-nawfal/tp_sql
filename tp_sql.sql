show databases;
create database tp_sql;
use tp_sql;

#exercice 1

create table representation (
	num_rep int not null auto_increment,
    titre_rep varchar(255) not null,
    lieu text not null,
    primary key(num_rep)
);
drop table representation;

create table musicien (
	num_mus int not null auto_increment,
    nom varchar(255) not null,
    num_rep int not null,
    constraint fk_num_rep foreign key (num_rep) references representation(num_rep),
    primary key(num_mus)
);
drop table musicien;

create table programmer (
	date date not null,
    num_rep int not null,
    tarif int not null,
    constraint fk_num_rep2 foreign key (num_rep) references representation(num_rep)
);
drop table programmer;

#1
select titre_rep from representation;
#2
select titre_rep from representation where lieu = 'theatre JCC';
#3
select musicien.nom,representation.titre_rep from musicien inner join representation on musicien.num_rep = representation.num_rep;
#4
select r.titre_rep,r.lieu,p.tarif from representation as r inner join programmer as p on r.num_rep = p.num_rep where p.date = '2021-02-28';
#5
select count(*) from musicien as m inner join representation as r on m.num_rep = r.num_rep where m.num_rep = 15;
#6
select r.*,p.date from representation as r inner join programmer as p on r.num_rep = p.num_rep where p.tarif <= 30;

#exercice 2

create table departements (
	dno int not null,
    dnom varchar(255) not null,
    dir varchar(255) not null,
    ville varchar(255) not null,
    primary key(dno)
);

create table employes (
	eno int not null,
    enom varchar(255) not null,
    prof varchar(255) not null,
    dateemb date not null,
    com int not null,
    sal int not null,
    dno int not null,
    primary key(eno),
    constraint fk_dno foreign key (dno) references departements(dno)
);

#1
select * from employes where com > 0;
#2
select enom,prof,sal from employes order by sal desc;
#3
select avg(sal) from employes;
#4
select avg(e.sal) from employes as e inner join departements as d on e.dno = d.dno where dnom = 'production';
#5
select d.dno,max(e.sal) from departements as d inner join employes as e on d.dno = e.dno;
#6
