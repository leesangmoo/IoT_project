show databases;

create table building_register(
	building_name varchar(50) not null primary key
);


create table apply_table(
	human_name varchar(50),
	time_s datetime,
	building_name varchar(50),
	building_sub_name varchar(50),
	text varchar(50),
	sysname varchar(100) default 'default.jpg',
	orgname varchar(100) default 'default.jpg',
	FOREIGN KEY (building_name) REFERENCES building_register (building_name)
);

DROP TABLE building_register

DESC apply_table
select * from apply_table
show table;