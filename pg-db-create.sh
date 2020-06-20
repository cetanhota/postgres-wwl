#!/bin/bash

psql -c "create database medicaid"

psql -c "create database phonebook"

psql phonebook -c "CREATE TABLE phonebook(phone VARCHAR(32), firstname VARCHAR(32), lastname VARCHAR(32), address VARCHAR(64));"

psql phonebook -c "INSERT INTO phonebook(phone, firstname, lastname, address) VALUES('+1 123 456 7890', 'John', 'Doe', 'North America');"

psql medicaid -c "create table medidata as select * from pg_class,pg_description;"

psql medicaid -c "create table medidata2 as select * from pg_class,pg_description;"

psql -c "create database medcare;"

psql medcare -c "create user meduser password '1234';"

psql medcare -U meduser -c "create table med_tab as select * from pg_class,pg_description;"

psql medcare -U meduser -c "create table med_tab1 (id int,name varchar);"

psql medcare -U meduser -c "insert into med_tab1 values(generate_series(1,10000),'postgres_boss');"

psql medcare -U meduser -c "insert into med_tab1 values(generate_series(10001,10000000),'postgres_boss');"

psql medcare -U meduser -c "select count(*) from med_tab1;"

psql medcare -U meduser -c "select count(*) from med_tab;"

psql -c "create database minicare;"

psql minicare -c "create user miniuser password '1234';"

psql minicare -U miniuser -c "create table mini_tab1 (id int,name varchar);"

psql minicare -U miniuser -c "insert into mini_tab1 values(generate_series(1,10000),'postgres_boss');"

psql minicare -U miniuser -c "insert into mini_tab1 values(generate_series(10001,10000000),'postgres_boss');"

psql minicare -U miniuser -c "delete from mini_tab1 where id between 1 and 500;"

psql minicare -U enterprisedb -c "update mini_tab1 set id=1 where id between 1 and 500;"

psql phonebook -c "SELECT * FROM phonebook ORDER BY lastname;"

psql phonebook -c "SELECT * FROM phonebook WHERE lastname = 'Doe';"

psql phonebook -c "SELECT * FROM phonebook WHERE firstname = 'John' AND lastname = 'Doe';"

psql phonebook -c "UPDATE phonebook SET address = 'North America', phone = '+1 123 456 7890' WHERE firstname = 'John' AND lastname = 'Doe';"

psql phonebook -c "DELETE FROM phonebook WHERE firstname = 'John' AND lastname = 'Doe';"
