select goods_id from total_supply where total_supply < (select sum(demand) from consumer group by goods_id);
select sum(consumer.demand) ,TOTAL_SUPPLY.TOTAL_SUPPLY from consumer group by consumer.goods_id join total_supply on consumer.goods_id=total_supply.goods_id;