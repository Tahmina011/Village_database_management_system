/*<TOAD_FILE_CHUNK>*/
insert into Family(family_id,educated_member,religion,phone_no) values (10001,04,'Islam',88017894901);
insert into Family(family_id,educated_member,religion,phone_no) values (10002,03,'Islam',88017989807);
insert into Family(family_id,educated_member,religion,phone_no) values (10003,03,'Hindu',88017058543);
insert into Family(family_id,educated_member,religion,phone_no) values (10004,03,'Islam',88017367123);
insert into Family(family_id,educated_member,religion,phone_no) values (10005,03,'Islam',88017138900);

insert into Family(family_id,educated_member,religion,phone_no) values (10006,02,'Hindu',88017133700);
insert into Family(family_id,educated_member,religion,phone_no) values (10007,02,'Islam',88017138911);
insert into Family(family_id,educated_member,religion,phone_no) values (10008,01,'Hindu',88017138933);
insert into Family(family_id,educated_member,religion,phone_no) values (10009,02,'Islam',88017138945);
insert into Family(family_id,educated_member,religion,phone_no) values (10010,02,'Islam',88017138967);

set serveroutput on;
create or replace trigger trigage before insert or delete or update on person for each row
declare
ag integer;
begin
ag:=months_between(to_date(sysdate),to_date(:new.date_of_birth))/12;
 :new.age:=ag;
/*update person set age=ag where id=:new.id;*/
end;
/

set serveroutput on
create or replace trigger trigmem after insert or update or delete on person for each row
declare 
per FAMILY.TOTAL_MEMBER%type;
begin
select total_member into per from family where family_id=:new.family_id;
per:=per+1;
update family set total_member=per where family_id=:new.family_id;
end;

set serveroutput on
create or replace trigger trigpincome after insert or update or delete on person for each row
declare
inc PERSON.INCOME%type;
q PERSON.INCOME%type;
begin
select family_income into inc from family where family_id=:new.family_id;
q:=inc+:new.income;
update family set family_income=q where family_id=:new.family_id;
end;

insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000001,'Sufia Begum','12-MAR-1975','female','Housewife',0,10001);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000002,'Rashid uddin','23-MAR-1970','male','Farmer',15000,10001);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000003,'Md. Kamal','01-JUN-1989','male','Teacher',20000,10001);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000004,'Golapi Begum','03-FEB-1993','female','Housewife',0,10001);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000005,'Faria sultana','09-JUN-1994','female','Teacher',23000,10001);

insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000006,'MD.Rayhan Islam','12-MAR-1975','male','Teacher',22000,10002);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000007,'Mariam Begum','23-APR-1977','female','Housewife',0,10002);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000008,'Rita Islam','13-JAN-1989','female','lawyer',35000,10002);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000009,'MD.Mukit Islam','21-DEC-1990','male','student',0,10002);

insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000010,'Bikash Chandra Das','25-MAR-1977','male','Engineer',40000,10003);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000011,'Dolon Rani Das','21-FEB-1979','female','Housewife',0,10003);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000012,'Dibakar Chandra Das','11-JUL-1989','male','Student',0,10003);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000013,'Bindu Rani Das','11-JUL-1989','female','student',0,10003);

insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000014,'Abdul Kader Molla','13-FEB-1970','male','Farmer',0,10004);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000015,'Sumona Begum','30-JUN-1977','female','Housewife',0,10004);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000016,'Sariful Molla','10-SEP-1989','male','Teacher',35000,10004);
insert into Person (id,name,date_of_birth,gender,profession,income,family_id) values (71000017,'Hosneara Begum','02-MAR-1991','female','Housewife',0,10004);
insert into Person (id,name,date_of_birth,gender,profession,income,family_id)values (71000018,'Hasibul Molla','10-SEP-1989','male','Engineer',50000,10004);
insert into Person (id,name,date_of_birth,gender,profession,income,family_id) values (71000019,'Shifa Akter','11-JUL-1989','female','Student',0,10004);

insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000020,'Monirul Talukder','13-FEB-1970','male','Farmer',20000,10005);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000021,'Monoara Begum','19-FEB-1974','female','Housewife',0,10005);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000022,'Manik Talukder','13-FEB-1980','male','Teacher',35000,10005);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000023,'Noori Akter','24-FEB-1990','female','Housewife',0,10005);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000024,'Mahima Talukder','13-FEB-1992','female','Graduate',0,10005);

insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000025,'Nahida Akter','01-JUN-1989','female','Housewife',0,10006);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000026,'Mahim Talukder','01-JUN-1988','male','Doctor',40000,10006);


insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000027,'Masuda Khatun','01-JUN-1997','female','Student',0,10007);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000028,'Parvej Hossain','09-JUN-1989','female','Farmer',45000,10007);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000029,'Sumaiya Akter','07-JUN-1989','female','Housewife',0,10007);

insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000030,'Nisha Akter','01-JUN-1989','female','Student',0,10008);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000031,'Mahi Islam','01-MAR-1989','male','Graduate',15000,10008);

insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000032,'Mousumi Islam','01-JAN-1989','female','Graduate',12000,10009);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000033,'Mahima Talukder','01-FEB-1989','male','Graduate',10000,10009);

insert into Person(id,name,date_of_birth,gender,profession,income,family_id)  values (71000034,'Noorani Begum','01-JUN-1957','female','Housewife',0,10010);
insert into Person(id,name,date_of_birth,gender,profession,income,family_id) values (71000035,'Nazim Hossain','01-JUN-1955','male','Farmer',25000,10010);


set serveroutput on

create or replace  trigger triggood after insert or update or delete on goods for each row
declare
p GOODS.GOODS_ID%type;
begin
insert into total_supply(goods_id) values  (:new.GOODS_ID);
end;
/

show errors;

/*<TOAD_FILE_CHUNK>*/
insert into Goods values (0001,'Chilies',50);
insert into Goods values (0002,'Ginger',100);
insert into Goods values (0003,'Onion',70);
insert into Goods values (0004,'Rice',32);
insert into Goods values (0005,'Potato',25);
insert into Goods values (0006,'Brinjal',50);
insert into Goods values (0007,'Tomato',60);
insert into Goods values (0008,'Corn',45);

set serveroutput on

create or replace  trigger trigtotal after insert or update or delete on production for each row
declare
p PRODUCTION.SUPPLY%type;
q PRODUCTION.SUPPLY%type;
begin
select total_supply into p from total_supply where GOODS_ID=:new.GOODS_ID;
q:=p+:new.supply;
update  total_supply set total_supply=q where TOTAL_SUPPLY.GOODS_ID=:new.GOODS_ID;
end;
/
set serveroutput on
create or replace trigger trigincome after insert or delete or update on production for each row
declare
price GOODS.PRICE%type;
income PERSON.INCOME%type;
incc FAMILY.FAMILY_INCOME%type;
begin
select price into price from goods where goods_id=:new.goods_id;
select family_income into incc from family where family_id=:new.family_id;
income:=incc+ price*:new.supply;
update family set family_income=income where family_id=:new.family_id;
end;

/*<TOAD_FILE_CHUNK>*/
insert into Production values (10001,0004,750);
insert into Production values (10002,0004,700);
insert into Production values (10002,0001,720);
insert into Production values (10001,0006,500);
insert into Production values (10003,0002,900);
insert into Production values (10004,0002,650);
insert into Production values (10004,0003,550);
insert into Production values (10004,0005,950);
insert into Production values (10009,0007,5);
insert into Production values (10008,0008,1750);

set serveroutput on

create or replace  trigger trigcon after insert or update or delete on consumer for each row
declare
p consumer.demand%type;
q consumer.demand%type;
begin
select total_supply into p from total_supply where GOODS_ID=:new.GOODS_ID;
if(p>:new.demand) then
q:=p-:new.demand;
update  total_supply set total_supply=q where TOTAL_SUPPLY.GOODS_ID=:new.GOODS_ID;
else 
dbms_output.put_line('Transaction is not possilbe because total_supply of this good is empty');
end if;
end;
/

/*<TOAD_FILE_CHUNK>*/
insert into Consumer values (10002,0008,50);
insert into Consumer values (10004,0003,40);
insert into Consumer values (10003,0002,35);
insert into Consumer values (10008,0007,50);
insert into Consumer values (10008,0002,25);

insert into Consumer values (10001,0008,60);
insert into Consumer values (10005,0006,10);
insert into Consumer values (10006,0005,15);
insert into Consumer values (10007,0001,50);
insert into Consumer values (10010,0004,20);


commit;

