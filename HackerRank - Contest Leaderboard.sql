select H.hacker_id, H.name, sum(S.max_score) as total_score
from hackers H
inner join (
    select hacker_id, challenge_id, max(score) as max_score
    from submissions S
    group by hacker_id, challenge_id
) as S
on H.hacker_id = S.hacker_id
group by hacker_id, name
having total_score > 0 
order by total_score desc, hacker_id asc