# Write your MySQL query statement below
# 각 부서에서 급여가 가장 높은 사람들

select
    ranked_emp.Department,
    ranked_emp.Employee,
    ranked_emp.Salary
from (
    select
        d.name Department,
        e.name Employee,
        e.salary Salary,
        dense_rank() over(partition by e.departmentId order by e.salary desc) sal_rank
    from Employee e
    join Department d
        on e.departmentId = d.id
) ranked_emp
where ranked_emp.sal_rank = 1