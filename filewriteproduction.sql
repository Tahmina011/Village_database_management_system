set serveroutput on
declare
f utl_file.file_type;
line varchar (1000);

f_id PRODUCTION.FAMILY_ID%type;
g_id PRODUCTION.GOODS_ID%type;
sup PRODUCTION.SUPPLY%type;


begin
f:= utl_file.fopen('PRODUCTION','PRODUCTION2.csv','r');
if utl_file.is_open(f) then
utl_file.get_line(f,line,1000);
dbms_output.put_line(line);
loop begin
utl_file.get_line(f,line,1000);
if line is null then exit;
end if;
            f_id:=regexp_substr(line, '[^,]+',1,1);
            g_id:=regexp_substr(line, '[^,]+',1,2);
           sup:=regexp_substr(line, '[^,]+',1,3);   
            insert into production values(f_id,g_id,sup);
            commit;
            dbms_output.put_line(line);
            exception when no_data_found then exit;
            end;
end loop;
end if;
   
    utl_file.fclose(f);
   
end;
/


