Enter password: ******************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 79
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database chevaux_ecurie ;
Query OK, 1 row affected (0.15 sec)

mysql> create table personne (
    -> IDP int primary key ,
    -> nom varchar(20) ,
    -> prenom varchar(20) ,
    -> adress varchar(40) ,
    -> tel int );
ERROR 1046 (3D000): No database selected
mysql> use chevaux_ecurie ;
Database changed
mysql> create table personne (
    -> IDP int primary key ,
    -> nom varchar(20) ,
    -> prenom varchar(20) ,
    -> adress varchar(40) ,
    -> tel int );
Query OK, 0 rows affected (0.43 sec)

mysql> create table foction (
    -> IDF int primary key ,
    -> fonction varchar(20) );
Query OK, 0 rows affected (0.30 sec)

mysql> insert into foction values
    -> (1 , 'directeur'),
    -> (2 , 'secrétaire'),
    -> (3 , 'éleveur'),
    -> (4 , 'comptable'),
    -> (5 , 'proprétaire'),
    -> (6 , 'entretien'),
    -> (6 , 'éleveur-propriétaire') ) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 8
mysql> insert into foction values
    -> (1 , 'directeur'),
    -> (2 , 'secrétaire'),
    -> (3 , 'éleveur'),
    -> (4 , 'comptable'),
    -> (5 , 'proprétaire'),
    -> (6 , 'entretien'),
    -> (6 , 'éleveur-prop') ) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 8
mysql> insert into foction values
    -> (1 , 'directeur'),
    -> (2 , 'secrétaire'),
    -> (3 , 'éleveur'),
    -> (4 , 'comptable'),
    -> (5 , 'proprétaire'),
    -> (6 , 'entretien'),
    -> (6 , 'éleveur-propriétaire')  ;
ERROR 1062 (23000): Duplicate entry '6' for key 'foction.PRIMARY'
mysql> insert into foction values
    -> (1 , 'directeur'),
    -> (2 , 'secrétaire'),
    -> (3 , 'éleveur'),
    -> (4 , 'comptable'),
    -> (5 , 'proprétaire'),
    -> (6 , 'entretien'),
    -> (7 , 'éleveur-propriétaire')  ;
Query OK, 7 rows affected (0.11 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE PROPRETAIRE (
    -> IDP INT ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> CREATE TABLE PROPRETAIRE (
    -> IDP INT ,
    -> IDC int ,
    -> prix int ,
    -> date date );
Query OK, 0 rows affected (0.53 sec)

mysql> create table cheval (
    -> IDC int primary key ,
    -> nomch varchar(10) ,
    -> numtat int ,
    -> couleur varchar(10),
    -> IDC_mere int ,
    -> IDC_pere int ,
    -> IDRACE INT,
    -> idElevateur int ) ;
Query OK, 0 rows affected (0.34 sec)

mysql> alter table proprietaire
    -> add foreign key (IDP) references personne(IDP);
ERROR 1146 (42S02): Table 'chevaux_ecurie.proprietaire' doesn't exist
mysql> show tables ;
+--------------------------+
| Tables_in_chevaux_ecurie |
+--------------------------+
| cheval                   |
| foction                  |
| personne                 |
| propretaire              |
+--------------------------+
4 rows in set (0.06 sec)

mysql> alter table propretaire
    -> add foreign key (IDP) references personne(IDP);
Query OK, 0 rows affected (0.93 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table proprietaire
    -> add foreign key (IDC) references cheval(IDC);
ERROR 1146 (42S02): Table 'chevaux_ecurie.proprietaire' doesn't exist
mysql> alter table propretaire
    -> add foreign key (IDC) references cheval(IDC);
Query OK, 0 rows affected (1.50 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table race (
    -> IDRACE INT PRIMARY KEY ,
    -> poid int ,
    -> taille int );
Query OK, 0 rows affected (0.28 sec)

mysql> alter table cheval
    -> add foreign key (IDC_mere) references cheval(IDC);
Query OK, 0 rows affected (0.77 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval
    -> add foreign key (IDC_pere) references cheval(IDC);
Query OK, 0 rows affected (0.77 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval
    -> add foreign key (IDRACE) references race(IDRACE);
Query OK, 0 rows affected (1.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval
    -> add foreign key (idELEVATEUR) references personne(IDp);
Query OK, 0 rows affected (1.38 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table concours (
    -> nomC varchar(10) ,
    -> annec year ,
    -> nbrpar int );
Query OK, 0 rows affected (0.51 sec)

mysql> alter table concours
    -> add primary key (nomC , annec);
Query OK, 0 rows affected (0.64 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table participation (
    -> IDC INT ,
    -> nomc varchar(10) ,
    -> annec year ,
    -> place int );
Query OK, 0 rows affected (0.35 sec)

mysql> alter table participation
    -> add foreifn key (IDC) references chevel(idc);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'key (IDC) references chevel(idc)' at line 2
mysql> alter table participation
    -> add foreign key (IDC) references chevel(idc);
ERROR 1824 (HY000): Failed to open the referenced table 'chevel'
mysql> alter table participation
    -> add foreign key (IDC) references cheval(idc);
Query OK, 0 rows affected (0.91 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table participation
    -> add foreign key (nomc) references concours(nomc);
Query OK, 0 rows affected (1.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table participation
    -> add foreign key (annec) references concours(annec);
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'participation_ibfk_3' in the referenced table 'concours'
mysql> alter table participation
    -> add foreign key (annec) references concours(annec);
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'participation_ibfk_3' in the referenced table 'concours'
mysql> create table croissace (
    -> idcr int primary key ,
    -> mois int ,
    -> taille cr int ,
    -> poidcr int ,
    -> idc int );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'cr int ,
poidcr int ,
idc int )' at line 4
mysql> create table croissance (
    -> idcr int primary key ,
    -> mois int ,
    -> taille cr int ,
    -> poidcr int ,^C
mysql> create table croissance (
    -> idcr int primary key ,
    -> mois int ,
    -> taille  int ,
    -> poidcr int ,
    -> idc int );
Query OK, 0 rows affected (0.30 sec)

mysql> alter table croissance
    -> add foreihn key (idc) references cheval(idc);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'key (idc) references cheval(idc)' at line 2
mysql> alter table croissance
    -> add foreign key (idc) references cheval(idc);
Query OK, 0 rows affected (1.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>