select 
case
    when occupation = 'Doctor' then concat(name,'(D)')
    when occupation = 'Singer' then concat(name,'(S)')
    when occupation = 'Professor' then concat(name,'(P)')
    when occupation = 'Actor' then concat(name,'(A)')
end as name_letter
from occupations
order by name asc;

select concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.')
from occupations
group by occupation
order by count(occupation) asc, occupation asc;