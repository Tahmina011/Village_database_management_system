set serveroutput on;
create or replace trigger trigage after insert or delete or update on person for each row
declare
ag integer;
begin
ag:=months_between(to_date(sysdate),to_date(:new.date_of_birth))/12;
:new.age:=ag;
end;
/