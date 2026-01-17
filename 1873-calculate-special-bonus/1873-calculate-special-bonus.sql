SELECT employee_id,
    CASE WHEN MOD(employee_id,2)=1 AND UPPER(LEFT(name,1))!='M'
    THEN salary
    ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id
