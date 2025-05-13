# Write your MySQL query statement below
select
    e_cnt.email Email
from (
    select
        email,
        count(*) cnt
    from Person
    group by email
) e_cnt
where e_cnt.cnt > 1