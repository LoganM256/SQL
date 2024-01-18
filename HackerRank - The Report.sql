select 
case
    when G.grade >= 8 then name
    else NULL
end as name_choice,
G.grade, S.marks
from Students S
join Grades G on S.marks between G.min_mark and G.max_mark
order by grade desc, name asc