-- Window Functions
-- This file contains window functions and aggregations for employee analytics.

-- Display each employee's details with the maximum EMP_RATING in their department
SELECT
    emp_id,
    first_name,
    last_name,
    role,
    dept,
    emp_rating,
    MAX(emp_rating) OVER (
		PARTITION BY dept) AS max_dept_rating
FROM emp_records;

-- Calculate the minimum and maximum salary of employees in each role
SELECT
    role,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM emp_records
GROUP BY role;

-- Assign ranks to each employee based on experience
SELECT
    first_name,
    last_name,
    exp,
    DENSE_RANK() OVER (
		ORDER BY exp DESC) AS rank
FROM emp_records;

