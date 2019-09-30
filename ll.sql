set serveroutput on
 

declare
type arra is varray(10000) of integer;
b arra:=arra();
l arra:=arra();
n integer;
begin
b.extend(1000);
l.extend(1000);
production_income(b,l);
for n in 1..b.count
loop
dbms_output.put_line(b(n)||':'||l(n));
end loop;
end;
/
