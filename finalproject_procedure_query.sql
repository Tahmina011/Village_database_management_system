set serveroutput on;
declare
population FAMILY.TOTAL_MEMBER%type;
female  FAMILY.TOTAL_MEMBER%type;
male  FAMILY.TOTAL_MEMBER%type;
percapita  FAMILY.FAMILY_INCOME%type;
educated FAMILY.TOTAL_MEMBER%type;
jobless number;
percentage number(5,4);
procedure information is
begin
select sum(total_member)  into population from family;
select count (*) into female from person where gender='female';
select sum(family_income) into percapita from family;
select count(*) into jobless from person where income=0 and age>18 and age<65;
select sum(educated_member) into educated from family;
dbms_output.put_line('POPULATION: '||population);
percentage:=(female/population);
dbms_output.put_line('FEMALE RATE: '||percentage*100||'%');
percentage:=(1-percentage);
dbms_output.put_line('MALE RATE: '||percentage*100||'%');
percapita:=(percapita/population);
dbms_output.put_line('PER-CAPITA-INCOME: '||percapita);
percentage:=(jobless/population);
dbms_output.put_line('UNEMPLOYMENT RATE: '||percentage*100||'%');
percentage:=(educated/population);
dbms_output.put_line('EDUCATION RATE: '||percentage*100||'%');
end;
begin
information();
end;
