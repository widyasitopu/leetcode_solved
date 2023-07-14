# Write your MySQL query statement below
select t.student_id, t.student_name, j.subject_name, count(e.subject_name) as attended_exams
from students t
cross join subjects j 
left join examinations e on t.student_id = e.student_id and j.subject_name = e.subject_name
group by t.student_id, j.subject_name
order by t.student_id, j.subject_name;
