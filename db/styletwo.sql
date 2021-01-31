create table cities(
name varchar(15) not null,
code int primary key
);
create table students(
name varchar(30) not null,
roll_number int primary key,
indian varchar(3) not null,
address varchar(100) not null,
gender varchar(6) not null
);