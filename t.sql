set serveroutput on
create or replace trigger trigmem after insert or update or delete on person for each row
declare 
per FAMILY.TOTAL_MEMBER%type;
begin
select total_member into per from family where family_id=:new.family_id;
per:=per+1;
update family set total_member=per where family_id=:new.family_id;
end;