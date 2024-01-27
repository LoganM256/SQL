select start_date, end_date 
from (
    select row_number() over(order by start_date) as rn, start_date
    from projects 
    where start_date not in 
        (select end_date
        from projects)
) t1
join (
select row_number() over(order by end_date) as rn, end_date
     from projects 
     where end_date not in 
        (select start_date
        from projects)
) t2
on t1.rn = t2.rn
order by end_date - start_date