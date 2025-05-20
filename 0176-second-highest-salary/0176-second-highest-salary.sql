# Write your MySQL query statement below
# 중복 없이 2위
# 2위가 없으면 null

select
    if(count(*) >= 1, emp.salary, null) SecondHighestSalary
from (
    select
        salary,
        dense_rank() over(order by salary desc) sal_rank
    from Employee
) emp
where emp.sal_rank = 2