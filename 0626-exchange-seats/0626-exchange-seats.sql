# Write your MySQL query statement below
# 연속된 학생 자리 swap 하기, 학생 수가 홀수라면 마지막은 pass, id는 유지
with full_seat as (
    select
        *,
        LAG(student) over(order by id) as prev,
        LEAD(student) over(order by id) as next
    from Seat
)

select
    id,
    case
        when id % 2 = 0 then prev
        when next is not null and id % 2 != 0 then next
        when next is null and id % 2 != 0 then student
    end as student
from full_seat;
    
