# Write your MySQL query statement below
with cust as(
  select if(
    count(distinct product_key) = (select count(1) from product),
    customer_id, null
  ) as c
  from customer
  group by customer_id
)

select c as customer_id
from cust
where c is not null
order by c;