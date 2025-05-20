# Write your MySQL query statement below
# 조건1: 내림차순
# 조건2: 같은 점수는 같은 등수
# 조건3: 1, 2, 2, 3 이런식으로

select
    score,
    dense_rank() over(order by score desc) `rank`
from Scores