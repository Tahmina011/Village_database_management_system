set serveroutput on

create or replace type arra is varray(10000) of integer;
/
create or replace procedure production_income( f_id out arra,t_in out arra)
is
p_id FAMILY.FAMILY_ID%type:=1;
CURSOR c IS select production.family_id,PRODUCTION.SUPPLY*GOODS.PRICE as productin_income  from production natural join goods;
begin
open c;
loop
f_id.extend;
t_in.extend;
fetch c into f_id(p_id),t_in(p_id);
p_id:=p_id+1;
exit when c%notfound;
end loop;
end;
/
show errors;

