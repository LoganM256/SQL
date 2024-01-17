select ceil(avg(e.salary) - avg(replace(e.salary, 0, '')))
from employees as e