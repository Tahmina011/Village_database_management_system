set serveroutput on
declare
type arrap is varray(10000) of integer;
p arrap:=arrap();
b arrap:=arrap();
c integer;
begin
p.extend(1000);
b.extend(1000);
production_income(p,b);
for c in 1..p.count
loop
dbms_output.put_line(p(c)||':'||b(c));
end loop;
end;
/
show errors;