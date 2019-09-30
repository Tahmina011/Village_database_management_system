create or replace FUNCTION total_number(x IN integer,y IN integer)
RETURN integer
IS
i PERSON.DATE_OF_BIRTH%type;
r_age integer;
coun integer:=0;
cursor dob is select date_of_birth from person;
begin
open dob;
loop
fetch dob into i;
exit when dob%notfound;
r_age:=age(i);
if(r_age>=x and r_age<=y)
then coun:=coun+1;
end if;
end loop;
return coun;
end;
