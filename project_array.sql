set serveroutput on;
declare
pname PERSON.NAME%type;
p_id PERSON.ID%type;
p_dob PERSON.DATE_OF_BIRTH%type;
c integer:=1;
length integer;
page integer;
d integer;
type array is varray(500) of PERSON.ID%type;
selected_candidates array:=array();
CURSOR cfemale IS select id,date_of_birth from person where gender='female';
begin
open cfemale;
loop
fetch cfemale into p_id,p_dob;
exit when cfemale%notfound;
page:= age(p_dob);
if page>=24 and page<=30 then
selected_candidates.extend;
selected_candidates(c):=p_id;
c:=c+1;
end if;
end loop;
length:=selected_candidates.count;
dbms_output.put_line('Selected Candidates for IT training:(ID:NAME)');
for d in 1..length
loop
select name into pname from person where id=selected_candidates(d);
dbms_output.put_line(selected_candidates(d)||':'||pname);
end loop;
end;
