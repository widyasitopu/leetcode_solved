# Write your MySQL query statement below
with a as(
  select num
  from mynumbers
  group by num
  having count(num) = 1
)

select ifnull(null, max(num)) as num
from a;