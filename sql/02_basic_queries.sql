-- Basic Employee Queries
-- This file contains basic SQL queries including select, where, group by, order by, concat, and union.

-- Fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT
SELECT
    emp_id,
    first_name,
    last_name,
    gender,
    dept
FROM emp_records;

-- Employees whose EMP_RATING is less than 2
SELECT
    emp_id,
    first_name,
    last_name,
    gender,
    dept,
    emp_rating
FROM emp_records
WHERE emp_rating < 2
ORDER BY last_name ASC;

-- Employees whose EMP_RATING is greater than 4
SELECT
    emp_id,
    first_name,
    last_name,
    gender,
    dept,
    emp_rating
FROM emp_records
WHERE emp_rating > 4
ORDER BY last_name ASC;

-- Employees whose EMP_RATING is between 2 and 4
SELECT
    emp_id,
    first_name,
    last_name,
    gender,
    dept,
    emp_rating
FROM emp_records
WHERE emp_rating BETWEEN 2 AND 4
ORDER BY emp_rating DESC, last_name ASC;

-- Concatenate FIRST_NAME and LAST_NAME of employees in Finance
SELECT
    CONCAT(first_name, ' ', last_name) AS name,
    dept
FROM emp_records
WHERE dept = 'FINANCE';

-- List all employees from Healthcare and Finance using UNION
SELECT
    first_name,
    last_name,
    dept
FROM emp_records
WHERE dept = 'HEALTHCARE'
UNION
SELECT
    first_name,
    last_name,
    dept
FROM emp_records
WHERE dept = 'FINANCE';
