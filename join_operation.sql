select production.family_id,PRODUCTION.SUPPLY*GOODS.PRICE as productin_income  from production natural join goods;
select consumer.family_id,CONSUMER.DEMAND*GOODS.PRICE as total_cost from consumer join goods using(goods_id);
select family.family_id,person.name as only_one_earned_person from person join family on family.family_income=person.income;