set serveroutput on

create or replace  trigger triggood after insert or update or delete on goods for each row
declare
p GOODS.GOODS_ID%type;
begin
insert into total_supply(goods_id) values  (:new.GOODS_ID);
end;
/
/*insert into total_supply (goods_id) values (0001);
insert into total_supply (goods_id) values (0002);
insert into total_supply (goods_id) values (0003);
insert into total_supply (goods_id) values (0004);
insert into total_supply (goods_id) values (0005);
insert into total_supply (goods_id) values (0006);
insert into total_supply (goods_id) values (0007);
insert into total_supply (goods_id) values (0008);*/