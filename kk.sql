set serveroutput on
create or replace trigger trigpincome after insert or update or delete on person for each row
declare
inc PERSON.INCOME%type;
begin
select sum(income) into inc from person group by :new.family_id;
update family set family_income=inc where family_id=:new.family_id;
end;