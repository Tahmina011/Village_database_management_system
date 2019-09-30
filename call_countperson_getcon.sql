set serveroutput on;
declare
p integer;
x PERSON.PROFESSION%type;
begin
countperson_getcontactnum('Doctor',p);
 dbms_output.put_line('Total number of doctor: '||p);
 end;