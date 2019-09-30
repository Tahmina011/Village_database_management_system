set serveroutput on;
declare
lessamountgoods CONSUMER.DEMAND%type;
type id is varray(100) of FAMILY.FAMILY_ID%type;
familyid id:=id();
type num is varray(100) of FAMILY.PHONE_NO%type;
phonenum num:=num();
type amnt is varray(100) of TOTAL_SUPPLY.TOTAL_SUPPLY%type;
amount amnt:=amnt();
c integer:=1;
cursor collectamount is select sum(demand) from consumer group by goods_id;
begin
open collectamount;
loop
amount.extend;
fetch collectamount into amount(c);
c:=c+1;
exit when collectamount%notfound;
end loop;
/*c:=1;*/
for c in 1..amount.count
loop
familyid.extend;
phonenum.extend;
select family_id,phone_no into familyid(c),phonenum(c) from family where family_id in
(select family_id from production where goods_id in 
(select goods_id from total_supply where total_supply < amount(c)));
end loop;
end;
show errors;