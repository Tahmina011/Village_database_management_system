set serveroutput on;
declare 
p PERSON.DATE_OF_BIRTH%type;
age integer;
begin
select date_of_birth into p from person where id=71000001;
select months_between(to_date(sysdate),
                      to_date(date_of_birth)
                     )/12
into age from person where id=71000001;

dbms_output.put_line(months_between(to_date(sysdate),to_date(p))/12);
dbms_output.put_line(age);
end;
/
