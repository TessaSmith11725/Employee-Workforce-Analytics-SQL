-- Window Functions
-- This file contains window functions and aggregations for employee analytics.

SELECT employee_id, first_name, last_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank,
       AVG(salary) OVER () AS average_salary
FROM employees;
