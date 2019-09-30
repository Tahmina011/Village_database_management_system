CREATE OR REPLACE PROCEDURE  total_price (x in GOODS.GOODS_ID%type,y in GOODS.PRICE%type,z out GOODS.PRICE%type) as
begin
select price into z from goods where goods_id in x;
z:=y*z;
end total_price;
/