select n, 
case
    when p is NULL then 'Root'
    when n in (select p from BST) then 'Inner'
    else 'Leaf'
end as node_type
from BST
order by n asc  