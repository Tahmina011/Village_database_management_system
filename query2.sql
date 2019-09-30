select family_id,phone_no  from family where family_id in
(select family_id from production where goods_id in 
(select goods_id from total_supply where total_supply < (select avg(demand) from consumer )));