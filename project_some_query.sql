select family_id,phone_no from family where family_id in(select family_id from production where goods_id in(select goods_id from total_supply where total_supply<700));
select name,family_id from person where profession='Farmer' and family_id in(select family_id from production where goods_id in(select goods_id from total_supply where total_supply<700));
