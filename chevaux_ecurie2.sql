Enter password: ******************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 89
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use cheval_ecurie ;
ERROR 1049 (42000): Unknown database 'cheval_ecurie'
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bdvol              |
| centre_formation   |
| chevaux_ecurie     |
| djallabasoft       |
| hollywood          |
| information_schema |
| isgi               |
| mysql              |
| newschema          |
| performance_schema |
| sakila             |
| sys                |
| test1              |
| test2              |
| test3              |
+--------------------+
15 rows in set (0.00 sec)

mysql> use chevaux_ecurie ;
Database changed
mysql> show tables;
+--------------------------+
| Tables_in_chevaux_ecurie |
+--------------------------+
| cheval                   |
| concours                 |
| croissance               |
| participer               |
| personne                 |
| propretaire              |
| race                     |
+--------------------------+
7 rows in set (0.06 sec)

mysql> select* from cheaval;
ERROR 1146 (42S02): Table 'chevaux_ecurie.cheaval' doesn't exist
mysql> select* from cheval;
+-----+--------+---------+----------+----------+--------+-------------+
| IDC | nomch  | couleur | IDC_mere | IDC_pere | IDRACE | idElevateur |
+-----+--------+---------+----------+----------+--------+-------------+
|   1 | sperit | jaune   |     NULL |     NULL |   NULL |        NULL |
+-----+--------+---------+----------+----------+--------+-------------+
1 row in set (0.02 sec)

mysql> select* from concours;
+--------+-------+--------+
| nomC   | annec | nbrpar |
+--------+-------+--------+
| sperit |  2020 |    245 |
+--------+-------+--------+
1 row in set (0.00 sec)

mysql> select* from croissance;
+------+------+--------+--------+------+
| idcr | mois | taille | poidcr | idc  |
+------+------+--------+--------+------+
|    1 |    4 |     34 |     56 |    1 |
+------+------+--------+--------+------+
1 row in set (0.00 sec)

mysql> select* from participer;
+------+--------+-------+-------+
| IDC  | nomc   | annec | place |
+------+--------+-------+-------+
|    1 | sperit |  2020 |     3 |
+------+--------+-------+-------+
1 row in set (0.00 sec)

mysql> select* from persoone;
ERROR 1146 (42S02): Table 'chevaux_ecurie.persoone' doesn't exist
mysql> select* from personne;
+-----+------+--------+--------------+--------+-------+-------+
| IDP | nom  | prenom | fonction     | adress | tel   | idsup |
+-----+------+--------+--------------+--------+-------+-------+
|   1 | noom | prenom | proprietaire | adr    | 12234 |  NULL |
+-----+------+--------+--------------+--------+-------+-------+
1 row in set (0.00 sec)

mysql> select* from propretaire;
+------+------+------+------------+
| IDP  | IDC  | prix | date       |
+------+------+------+------------+
|    1 |    1 | 3455 | 2020-12-12 |
+------+------+------+------------+
1 row in set (0.00 sec)

mysql> select* from race;
+--------+------+--------+
| IDRACE | poid | taille |
+--------+------+--------+
|      1 |   23 |     24 |
+--------+------+--------+
1 row in set (0.00 sec)

mysql> alter table race
    -> modify column idrace varchar(20);
ERROR 3780 (HY000): Referencing column 'IDRACE' and referenced column 'idrace' in foreign key constraint 'cheval_ibfk_3' are incompatible.
mysql> ALTER TABLE race DROP FOREIGN KEY cheval_ibfk_3;
ERROR 1091 (42000): Can't DROP 'cheval_ibfk_3'; check that column/key exists
mysql> show create table race;
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                       |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| race  | CREATE TABLE `race` (
  `IDRACE` int NOT NULL,
  `poid` int DEFAULT NULL,
  `taille` int DEFAULT NULL,
  PRIMARY KEY (`IDRACE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> alter cheval
    -> drop idrace;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'cheval
drop idrace' at line 1
mysql> alter table cheval
    -> drop idrace;
ERROR 1828 (HY000): Cannot drop column 'IDRACE': needed in a foreign key constraint 'cheval_ibfk_3'
mysql> alter cheval
    -> drop foreign key cheval_ibfk_3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'cheval
drop foreign key cheval_ibfk_3' at line 1
mysql> alter table cheval
    -> drop foreign key cheval_ibfk_3;
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table race
    -> drop idrace;
Query OK, 1 row affected (1.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> alter table race
    -> add column idrace varchar(20) primary key
    -> first;
Query OK, 0 rows affected (1.33 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * cheval;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'cheval' at line 1
mysql> select * from cheval;
+-----+--------+---------+----------+----------+--------+-------------+
| IDC | nomch  | couleur | IDC_mere | IDC_pere | IDRACE | idElevateur |
+-----+--------+---------+----------+----------+--------+-------------+
|   1 | sperit | jaune   |     NULL |     NULL |   NULL |        NULL |
+-----+--------+---------+----------+----------+--------+-------------+
1 row in set (0.00 sec)

mysql> alter table cheval
    -> add foreign key (idrace) references race(idrace);
ERROR 3780 (HY000): Referencing column 'idrace' and referenced column 'idrace' in foreign key constraint 'cheval_ibfk_5' are incompatible.
mysql> alter table cheval
    -> drop idrace;
Query OK, 0 rows affected (1.19 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from cheval;
+-----+--------+---------+----------+----------+-------------+
| IDC | nomch  | couleur | IDC_mere | IDC_pere | idElevateur |
+-----+--------+---------+----------+----------+-------------+
|   1 | sperit | jaune   |     NULL |     NULL |        NULL |
+-----+--------+---------+----------+----------+-------------+
1 row in set (0.00 sec)

mysql> select * from race;
+--------+------+--------+
| idrace | poid | taille |
+--------+------+--------+
|        |   23 |     24 |
+--------+------+--------+
1 row in set (0.00 sec)

mysql> desc race;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| idrace | varchar(20) | NO   | PRI | NULL    |       |
| poid   | int         | YES  |     | NULL    |       |
| taille | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> alter table cheval
    -> add column idrace varchar(20);
Query OK, 0 rows affected (0.38 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval
    -> add foreign key (idrace) references race(idrace);
Query OK, 1 row affected (1.48 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> update race
    -> set column idrace= 'ARABIAN' where poid = 23.
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'column idrace= 'ARABIAN' where poid = 23.' at line 2
mysql> update race
    -> set column idrace= 'ARABIAN' where poid = 23;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'column idrace= 'ARABIAN' where poid = 23' at line 2
mysql> UPDATE race
    -> SET idrace = 'ARABIAN'
    -> WHERE poid = 23;
Query OK, 1 row affected (0.12 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE cheval
    -> SET idrace = 'ARABIAN'
    -> WHERE idc = 1.
    -> ;
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from cheval;
+-----+--------+---------+----------+----------+-------------+---------+
| IDC | nomch  | couleur | IDC_mere | IDC_pere | idElevateur | idrace  |
+-----+--------+---------+----------+----------+-------------+---------+
|   1 | sperit | jaune   |     NULL |     NULL |        NULL | ARABIAN |
+-----+--------+---------+----------+----------+-------------+---------+
1 row in set (0.00 sec)

mysql> insert into cheval value
    -> (2 , 'cisco' , 'noir', null , null , 1 , 'Palomino'),
    -> (3 , 'artax' , 'noir', 2 , 1 , 1 , 'ARABIAN'),
    -> (4 , 'vega' , 'jaune', 2 , 1 , 1 , 'ARABIAN');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`chevaux_ecurie`.`cheval`, CONSTRAINT `cheval_ibfk_5` FOREIGN KEY (`idrace`) REFERENCES `race` (`idrace`))
mysql> insert into race values
    -> ('UPDATE race
    '> SET idrace = 'ARABIAN'
    '> WHERE poid = 23;
    '> ^C
mysql> insert into race values
    -> ('PALOMINO' , 24 , 35);
Query OK, 1 row affected (0.12 sec)

mysql> insert into race values
    -> ^C
mysql> insert into cheval value
    -> (2 , 'cisco' , 'noir', null , null , 1 , 'Palomino'),
    -> (3 , 'artax' , 'noir', 2 , 1 , 1 , 'ARABIAN'),
    -> (4 , 'vega' , 'jaune', 2 , 1 , 1 , 'ARABIAN');
Query OK, 3 rows affected (0.09 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select nomc
    -> from cheval
    -> where idrace ='ARABIAN'
    -> order by nomc desc;
ERROR 1054 (42S22): Unknown column 'nomc' in 'field list'
mysql> select nomch
    -> from cheval
    -> where idrace ='ARABIAN'
    -> order by nomc desc;
ERROR 1054 (42S22): Unknown column 'nomc' in 'order clause'
mysql> select nomc
    -> from cheval
    -> where idrace ='ARABIAN'
    -> order by nomch desc;
ERROR 1054 (42S22): Unknown column 'nomc' in 'field list'
mysql> select nomch
    -> from cheval
    -> where idrace ='ARABIAN'
    -> order by nomch desc;
+--------+
| nomch  |
+--------+
| vega   |
| sperit |
| artax  |
+--------+
3 rows in set (0.00 sec)

mysql> select nomc , poid ,taille
    -> from cheval
    -> join race race on race.idrace = cheval.idrace
    -> where idrace ='ARABIAN'
    -> order by nomch desc;
ERROR 1054 (42S22): Unknown column 'nomc' in 'field list'
mysql> select nomch , poid ,taille
    -> from cheval
    -> join race race on race.idrace = cheval.idrace
    -> where idrace ='ARABIAN'
    -> order by nomch desc;
ERROR 1052 (23000): Column 'idrace' in where clause is ambiguous
mysql> select nomc , poid ,taille
    -> from cheval
    -> join race race on race.idrace = cheval.idrace
    -> where race.idrace ='ARABIAN'
    -> order by nomch desc;
ERROR 1054 (42S22): Unknown column 'nomc' in 'field list'
mysql> select nomch , poid ,taille
    -> from cheval
    -> join race race on race.idrace = cheval.idrace
    -> where race.idrace ='ARABIAN'
    -> order by nomch desc;
+--------+------+--------+
| nomch  | poid | taille |
+--------+------+--------+
| vega   |   23 |     24 |
| sperit |   23 |     24 |
| artax  |   23 |     24 |
+--------+------+--------+
3 rows in set (0.00 sec)

mysql> select * from propretaire;
+------+------+------+------------+
| IDP  | IDC  | prix | date       |
+------+------+------+------------+
|    1 |    1 | 3455 | 2020-12-12 |
+------+------+------+------------+
1 row in set (0.00 sec)

mysql> select * from personne;
+-----+------+--------+--------------+--------+-------+-------+
| IDP | nom  | prenom | fonction     | adress | tel   | idsup |
+-----+------+--------+--------------+--------+-------+-------+
|   1 | noom | prenom | proprietaire | adr    | 12234 |  NULL |
+-----+------+--------+--------------+--------+-------+-------+
1 row in set (0.00 sec)

mysql> insert into personne values
    -> (2 , 'yey' , 'chii' , 'proprietaire' ,'california' , 6758999, null),
    -> (3 , 'WIWIWI' , 'chii' , 'proprietaire' ,'california' , 999, null),
    -> (4 , 'SUIIIIII' , 'chii' , 'proprietaire' ,'PLUTO' , 999, null);
Query OK, 3 rows affected (0.10 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into propretaire values
    -> (2 ,1  , 6778, '2021-01-13'),
    -> (3 ,1  , 677, '2021-08-13'),
    -> (4 ,1  , 3000, '2021-11-04'),
    -> (2 ,2  , 6778, '2020-01-13'),
    -> (3 ,2  , 62277, '2021-08-13'),
    -> (4 ,2  , 9876, '2022-03-05'),
    -> (1 , 2 , 6778, '2019-01-13'),
    -> (1 , 3 , 3563, '2020-01-13'),
    -> (2 , 3 , 4000, '2020-11-29'),
    -> (3 , 3 , 43000, '2021-03-08'),
    -> (4 , 3 , 4700, '2021-07-24'),
    -> (1 , 4 , 30000, '2023-02-14'),
    -> (2 , 4 , 30000, '2023-09-10'),
    -> (3 , 4 , 30000, '2023-11-17'),
    -> (4 , 4 , 30000, '2024-02-01');
Query OK, 15 rows affected (0.11 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> select disctint nom , prenom
    -> from proprietaire ;
ERROR 1146 (42S02): Table 'chevaux_ecurie.proprietaire' doesn't exist
mysql> select disctint nom , prenom
    -> from propretaire ;
ERROR 1054 (42S22): Unknown column 'disctint' in 'field list'
mysql> select distinct nom , prenom
    -> from propretaire ;
ERROR 1054 (42S22): Unknown column 'nom' in 'field list'
mysql> select * from propretaire;
+------+------+-------+------------+
| IDP  | IDC  | prix  | date       |
+------+------+-------+------------+
|    1 |    1 |  3455 | 2020-12-12 |
|    2 |    1 |  6778 | 2021-01-13 |
|    3 |    1 |   677 | 2021-08-13 |
|    4 |    1 |  3000 | 2021-11-04 |
|    2 |    2 |  6778 | 2020-01-13 |
|    3 |    2 | 62277 | 2021-08-13 |
|    4 |    2 |  9876 | 2022-03-05 |
|    1 |    2 |  6778 | 2019-01-13 |
|    1 |    3 |  3563 | 2020-01-13 |
|    2 |    3 |  4000 | 2020-11-29 |
|    3 |    3 | 43000 | 2021-03-08 |
|    4 |    3 |  4700 | 2021-07-24 |
|    1 |    4 | 30000 | 2023-02-14 |
|    2 |    4 | 30000 | 2023-09-10 |
|    3 |    4 | 30000 | 2023-11-17 |
|    4 |    4 | 30000 | 2024-02-01 |
+------+------+-------+------------+
16 rows in set (0.00 sec)

mysql> select dinstint nom , prenom
    -> from personne
    -> join propretaire in personne.idp = propretaire.idp;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'in personne.idp = propretaire.idp' at line 3
mysql> select dinstint nom , prenom
    -> from personne
    -> join propretaire on personne.idp = propretaire.idp;
ERROR 1054 (42S22): Unknown column 'dinstint' in 'field list'
mysql> select distinct nom , prenom
    -> from personne
    -> join propretaire on personne.idp = propretaire.idp;
+----------+--------+
| nom      | prenom |
+----------+--------+
| noom     | prenom |
| yey      | chii   |
| WIWIWI   | chii   |
| SUIIIIII | chii   |
+----------+--------+
4 rows in set (0.00 sec)

mysql> select nom , prenom
    -> from personne
    -> where idsup is null;
+----------+--------+
| nom      | prenom |
+----------+--------+
| noom     | prenom |
| yey      | chii   |
| WIWIWI   | chii   |
| SUIIIIII | chii   |
+----------+--------+
4 rows in set (0.00 sec)

mysql> select * from concours ;
+--------+-------+--------+
| nomC   | annec | nbrpar |
+--------+-------+--------+
| sperit |  2020 |    245 |
+--------+-------+--------+
1 row in set (0.00 sec)

mysql> select nomc
    -> from concours
    -> where annec='2019' ;
Empty set (0.00 sec)

mysql>