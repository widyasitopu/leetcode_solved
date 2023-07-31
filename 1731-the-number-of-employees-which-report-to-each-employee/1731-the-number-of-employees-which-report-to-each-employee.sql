# Write your MySQL query statement below
with puyeng as (
  select employee_id, name, (
    select count(1)
    from employees b
    where a.employee_id = b.reports_to
  ) as reports_count, round(
    (
      select avg(age)
      from employees c
      where a.employee_id = c.reports_to
    )
  ) as average_age
  from employees a
)

select employee_id, name, reports_count, average_age
from puyeng
where average_age is not null
order by employee_id;
