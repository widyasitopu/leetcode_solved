# Write your MySQL query statement below
with a as(
  select delivery_id, customer_id,  if(
    order_date = customer_pref_delivery_date, 'immediate', 'scheduled'
  ) as si, dense_rank() over(
    partition by customer_id
    order by order_date
  ) as ro
  from delivery
)

select round(
  sum(
    if(si = 'immediate', 1, 0)
  ) / count(si) * 100, 2
) as immediate_percentage
from a
where ro = 1;