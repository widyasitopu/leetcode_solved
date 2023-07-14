# Write your MySQL query statement below
select machine_id, round(
  (sum(
    if(activity_type = 'end', timestamp, 0)
  ) - sum(
    if(activity_type = 'start', timestamp, 0)
  ))/sum(
    if(activity_type = 'start', 1, 0)
  ), 3
) as processing_time
from activity
group by machine_id;
