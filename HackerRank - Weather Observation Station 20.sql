select 
    case
        when count(s.id) % 2 <> 0 
        /* checks if there are an even or odd number of entries */
            then (
                select round(sub.lat_n, 4)
                from (
                    select row_number() over(order by lat_n) as rn, lat_n
                    from station
                ) sub
                where sub.rn = (count(s.id) + 1) / 2 
            )
            /* above section creates a sub query to pull the lat_n from a sub query that creates a table to pull from with each row assigned a number in asc order by lat_n. Then checks where the mathamatical median matches the created row column and pulls that value. */
        else (
                select round(sub.lat_n,4)
                from (
                    select row_number() over(order by lat_n) as rn, lat_n
                    from station
                ) sub
                where sub.rn = ((count(s.id) / 2) + ((count(s.id) / 2) + 1))/2
            )
            /* Does the same check as above but with the formula for a median in an even list of numbers. */
    end
from station s;