# Write your MySQL query statement below
-- 매니저보다 많이 버는 직원 출력
select
    e1.name Employee
from Employee e1
join Employee e2
    on e1.managerId = e2.id
where e1.salary > e2.salary