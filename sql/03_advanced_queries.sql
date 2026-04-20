-- Advanced SQL Queries
-- This file contains advanced SQL queries including joins, nested queries, bonus calculations, and salary distributions.

SELECT employee_id, first_name, last_name, salary,
       (SELECT COUNT(*) FROM bonuses WHERE employee_id = e.employee_id) AS bonus_count,
       (SELECT AVG(salary) FROM employees) AS average_salary
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees);
