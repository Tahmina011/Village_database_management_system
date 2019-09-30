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
