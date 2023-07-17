# Write your MySQL query statement below
select round(
  count(distinct player_id) / (
    select count(distinct player_id)
    from activity
  ), 2
) as fraction
from(
  select player_id, min(event_date) as fl_date
  from activity
  group by player_id
) as a
where exists(
  select *
  from activity
  where player_id = a.player_id
    and event_date = date_add(a.fl_date, interval 1 day)
);