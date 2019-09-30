set serveroutput on
declare
  f utl_file.file_type;
    f_id PRODUCTION.FAMILY_ID%type;
    g_id PRODUCTION.GOODS_ID%type;
    sup PRODUCTION.SUPPLY%type;
    cursor pro is select * from production;
     
begin
    f:=utl_file.fopen('PRODUCTION','productionw.csv','w');
    utl_file.put(f, 'FAMILY_ID' || ',' ||  'GOODS_ID' || ',' || 'SUPPLY');
    utl_file.new_line(f);
    open pro;
        loop
        fetch pro into f_id,g_id,sup;
exit when pro%notfound;
             utl_file.put(f, f_id || ',' ||  g_id || ',' || sup);
             utl_file.new_line(f);
             end loop;
    
    utl_file.fclose(f);
   end;
    /