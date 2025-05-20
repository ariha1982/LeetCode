# Write your MySQL query statement below
select
    name Customers
from Customers
where id not in (
    select
        c.id
    from Customers c
    join Orders o
        on c.id = o.customerId
);