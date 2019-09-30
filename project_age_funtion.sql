create or replace FUNCTION age(x IN PERSON.DATE_OF_BIRTH%type)
RETURN integer
IS
page integer;
begin
page:=months_between(to_date(sysdate),to_date(x))/12;
return page;
end;