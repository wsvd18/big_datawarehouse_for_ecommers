SELECT 
    t.TABLE_NAME AS 'Table Name', 
    t.TABLE_COMMENT AS 'Table Comment', 
    c.COLUMN_NAME AS 'Column Name', 
    c.COLUMN_COMMENT AS 'Column Comment', 
    c.COLUMN_TYPE AS 'Data Type', 
    c.IS_NULLABLE AS 'Is Nullable', 
    c.COLUMN_KEY AS 'Key', 
    c.COLUMN_DEFAULT AS 'Default Value', 
    c.EXTRA AS 'Extra'
FROM 
    information_schema.COLUMNS c
JOIN 
    information_schema.TABLES t ON c.TABLE_NAME = t.TABLE_NAME
WHERE 
    c.TABLE_SCHEMA = 'bigdata_project_OLAP' 
    AND t.TABLE_SCHEMA = 'bigdata_project_OLAP';
		

 
 select * from
 (select sku_id,sum(sku_num) from cart_info   where is_ordered=1 group by sku_id) t1
 left join
 (select sku_id,sum(sku_num) from order_detail group by sku_id) t2
 on t1.sku_id=t2.sku_id
 --cart_info包含了order_details里没下单成功的信息
 
select * from 
 (select id,sum(final_total_amount) from order_info group by id) t1
 left join
 (select order_id,sum(total_amount) from payment_info group by order_id) t2
on t1.id=t2.order_id
left join
(select id,order_status from order_info) t3
on t1.id=t3.id;

select * from order_detail;
select * from order_info;
select * from user_info; 
select * from base_dic;

select * from base_province;
select * from base_region;

select * from order_info;
select * from order_detail;

--DWS
 select
t2.id as order_id,
YEAR(CURRENT_DATE()) - YEAR(t1.birthday) AS age,
t7.id as sku_id,
t4.sku_num,
t2.original_total_amount,
t3.dic_name,
t2.province_id,
t5.name as province_name,
t5.region_id,
t6.region_name,
t7.sku_name,
t10.id as category1_id,
t10.name as category1_name,
t9.id as category2_id,
t9.name as category2_name,
t8.id as category3_id,
t8.name as category3_name,
t2.create_time as ds
from user_info t1
join order_info t2 on t1.id=t2.user_id
join base_dic t3 on t2.order_status=t3.dic_code
join order_detail t4 on t2.id=t4.order_id
join base_province t5 on t2.province_id=t5.id
join base_region t6 on t5.region_id=t6.id
join sku_info t7 on t4.sku_id=t7.id
join base_category3 t8 on t7.category3_id=t8.id
join base_category2 t9 on t8.category2_id=t9.id
join base_category1 t10 on t9.category1_id=t10.id;
