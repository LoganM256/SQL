select 
max(if(occupation = 'Doctor', name, NULL)),
max(if(occupation = 'Professor', name, NULL)),
max(if(occupation = 'Singer', name, NULL)),
max(if(occupation = 'Actor', name, NULL))
from
(select name, occupation, Row_Number() over(partition by occupation order by name) as row_num 
from occupations) as sub_query
group by row_num