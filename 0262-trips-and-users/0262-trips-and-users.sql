# Write your MySQL query statement below
-- 취소율 = unbanned user의 취소된 요청 개수 / 전체 요청 개수
-- 고객과 드라이버 모두 밴 되면 안됨
-- 2013-10-01 ~ 2013-10-03

-- 1. user who banned
with ban_list as (
select
    users_id id
from Users
where banned = 'No')

-- except banned user request
select
    t.request_at Day,
    round(count(case when t.status != 'completed' then 1 end) / count(t.id), 2) 'Cancellation Rate'
from Trips t
join ban_list b1
    on t.client_id = b1.id
join ban_list b2
    on t.driver_id = b2.id
where t.request_at between date('2013-10-01') and date('2013-10-03')
group by t.request_at
order by t.request_at