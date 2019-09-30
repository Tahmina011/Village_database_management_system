set serveroutput on
create or replace procedure countperson_getcontactnum( p in PERSON.PROFESSION%type,coun out integer)
is
f_id PERSON.FAMILY_ID%type;
pro PERSON.PROFESSION%type;
n PERSON.NAME%type;
num FAMILY.PHONE_NO%type;
cursor prof is select family_id,name,profession from person;
begin
open prof;
coun:=0;
dbms_output.put_line('FAMILY_ID   NAME  PHONE NUMBER LIST OF '||p);
loop 
fetch prof into f_id,n,pro;
exit when prof%notfound;
if(pro=p) then
select phone_no into num from family where family_id=f_id;
coun:=coun+1;
 DBMS_OUTPUT.PUT_LINE(f_id||' : '||n||'   '||num);
 end if;
end loop;
end;
/