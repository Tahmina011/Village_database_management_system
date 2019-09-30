set serveroutput on;
declare 
counter integer:=1;
goodid GOODS.GOODS_ID%type;
c_demand CONSUMER.DEMAND%type;
t_supply TOTAL_SUPPLY.TOTAL_SUPPLY%type;
type array is varray(500) of GOODS.GOODS_ID%type;
less_goodsid array:=array();
cursor c_consumer is select goods_id,sum(demand) from consumer group by good_id;
begin
open c_cunsumer;
loop
fetch c_consumer into goodid,c_demand;
exit when c_consumer%notfound;
select total_supply into t_supply from total_supply where good_id=goodid;
if(t_supply<c_demand) then
less_goodsid.extend;
less_goodsid(c):=goodid;
c:=c+1;
end if;
end loop;
