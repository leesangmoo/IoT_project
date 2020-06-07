show databases;

create table building_register(
	building_name varchar(50) not null
);


create table apply_table(
	human_name varchar(50),
	time_s datetime,
	building_sub_name varchar(50),
	text varchar(50),
	sysname varchar(100) default 'default.jpg',
	orgname varchar(100) default 'default.jpg'
);

DROP TABLE apply_table

DESC apply_table

show table;