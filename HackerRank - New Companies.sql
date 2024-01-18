select C.company_code, C.founder, count(distinct LM.lead_manager_code), count(distinct SM.senior_manager_code), count(distinct M.manager_code), count(distinct E.employee_code)
from Company C
join Lead_Manager LM on C.company_code = LM.company_code
join Senior_Manager SM on LM.lead_manager_code = SM.lead_manager_code
join Manager M on SM.senior_manager_code = M.senior_manager_code
join Employee E on M.manager_code = E.manager_code
group by company_code, founder
order by company_code asc