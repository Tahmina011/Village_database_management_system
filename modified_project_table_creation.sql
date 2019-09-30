
drop table Consumer;
drop table Production;
drop table total_supply;
drop table Goods;
drop table Person;
drop table Family;






create table Family(
	family_id integer,
	total_member integer default 0,
	educated_member integer,
	religion varchar(20),
	phone_no number(11) unique,
	family_income integer default 0,
	primary key(family_id)
	);



create table Person(
	id integer,
	name varchar(30),
	date_of_birth DATE,
	gender varchar(10),
	profession varchar(40),
	income integer ,
	family_id integer,
	age integer default 0,
	primary key(id),
	foreign key(family_id) references Family(family_id)
	);

create table Goods(
 goods_id integer ,
 goods_name varchar(100) unique,
 price integer ,
 primary key(goods_id)
);

create table Production(
	family_id integer,
	goods_id integer,
	supply  integer,
	foreign key(family_id) references Family(family_id),
	foreign key(goods_id) references Goods(goods_id)
	);


create table Consumer(
	family_id integer,
	goods_id integer,
	demand integer,
	foreign key(family_id) references Family(family_id),
	foreign key(goods_id) references Goods(goods_id)
	);
	

create table total_supply(
goods_id integer,
total_supply integer default 0,
foreign key(goods_id) references Goods(goods_id)
);

	
commit;