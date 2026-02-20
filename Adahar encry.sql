create database data_encryption;
use data_encryption;

create table login(id int auto_increment primary key,username varchar(50),
enc_password varbinary(225) null);

insert into login(username,enc_password)values('aipa',aes_encrypt("aipa@1234"
,"bhadhohi"));
select*from login;

select id, username,aes_decrypt(enc_password,"bhadhohi")from login;

create table students_data(
ID tinyint auto_increment primary key,
U_ID BIGINT,
username varchar(40),
enc_password varbinary(225) null);

INSERT INTO  students_data
values( 1,123456789876,"adhar",aes_encrypt("akriti@198","Ayodhya"));

select * from  students_data;

select ID, U_ID, username, aes_decrypt(enc_password,"Ayodhya") from  students_data;



create table hashing(
id int auto_increment primary key,
username varchar(50),
enc_password char(64) not null);

insert into hashing 
values(1,"akriti",sha2("ap@2025",256));

select * from hashing;