select W.id, Sub.age, Sub.min_coins_needed, Sub.power 
from Wands W
join (
    select W.code, WP.age, min(W.coins_needed) as min_coins_needed, W.power
    from Wands W 
    join Wands_Property WP on W.code = WP.code
    where WP.is_evil = 0
    group by code, age, power
) as Sub 
on W.code = Sub.code and W.power = Sub.Power and W.coins_needed = Sub.min_coins_needed
order by Sub.power desc, Sub.age desc