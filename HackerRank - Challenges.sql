select h.hacker_id, h.name, count(c.challenge_id) as challenges_created
from hackers h 
join challenges c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having challenges_created = (
    select max(c_count_1) from 
        (select count(challenge_id) as c_count_1, hacker_id from challenges 
        group by hacker_id) as sub_1)
or challenges_created not in 
    (select c_count_2 from
        (select count(challenge_id) as c_count_2, hacker_id from
        challenges 
        group by hacker_id) as sub_2
    group by c_count_2 having count(c_count_2) > 1)
order by challenges_created desc, h.hacker_id asc