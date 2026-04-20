-- Views and Indexes
-- This file contains view creation and index optimization queries.

-- Create a view for employees in various countries whose salary is more than 6000
CREATE VIEW countriessalary6000 AS
SELECT
    emp_id,
    first_name,
    last_name,
    country,
    salary
FROM emp_records
WHERE salary > 6000
ORDER BY country;

SELECT *
FROM countriessalary6000;

-- Check execution plan before creating index
EXPLAIN
SELECT *
FROM emp_records
WHERE first_name = 'Eric';

-- Create an index to improve search performance on FIRST_NAME
CREATE INDEX idx_first_name
ON emp_records(first_name);

-- Check execution plan after creating index
EXPLAIN
SELECT *
FROM emp_records
WHERE first_name = 'Eric';

