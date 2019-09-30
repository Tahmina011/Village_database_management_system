select sum(total_member) as population from family;

select count(id) from person where gender='female';

select sum(family_income) from family;

select id,name from person where income=0;

select sum(educated_member) from family;

select family_id,phone_no  from family where family_id in
(select family_id from production where goods_id in 
(select goods_id from total_supply where total_supply < (select avg(demand) from consumer )));

select goods_id,avg(demand) from consumer group by goods_id;

select * from production where supply in(select max(supply) from production group by goods_id);