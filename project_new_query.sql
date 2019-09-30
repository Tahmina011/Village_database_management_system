set serveroutput on
create or replace trigger trigincome after insert or delete or update on production for each row
declare
price GOODS.PRICE%type;
income PERSON.INCOME%type;
begin
select price into price from goods where goods_id=:new.goods_id;
income:=price*:new.supply;
update family set total_income=income where family_id=:new.family_id;
end;