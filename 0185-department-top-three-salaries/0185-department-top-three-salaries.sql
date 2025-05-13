# Write your MySQL query statement below
-- 각 부서에서 돈 제일 많이 버는 사람 top3
with emp1 as (
    select
        *,
        dense_rank() over(partition by departmentId order by salary desc) emp_rank
    from Employee
)

select
    d.name Department,
    emp1.name Employee,
    emp1.salary Salary
from emp1
join Department d
    on d.id = emp1.departmentId
where emp1.emp_rank <= 3