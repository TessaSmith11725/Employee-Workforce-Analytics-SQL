-- Advanced Queries

-- 6. List employees who have someone reporting to them
-- Also show the number of reporters (including the President if applicable)
SELECT
    m.emp_id,
    m.first_name,
    m.last_name,
    COUNT(*) AS num_reporters
FROM emp_records e
JOIN emp_records m
    ON e.manager_id = m.emp_id
GROUP BY
    m.emp_id;

-- 12. Nested query to find employees with experience of more than ten years
SELECT *
FROM emp_records
WHERE emp_id IN (
    SELECT emp_id
    FROM emp_records
    WHERE exp > 10
);

-- 15. Calculate bonus for all employees based on ratings and salaries
-- Formula: 5% of salary * employee rating
SELECT
    emp_id,
    first_name,
    last_name,
    salary,
    emp_rating,
    (salary * 0.05) * emp_rating AS bonus
FROM emp_records;

-- 16. Calculate average salary distribution based on continent and country
SELECT
    continent,
    country,
    AVG(salary) AS average_salary
FROM emp_records
GROUP BY continent, country
ORDER BY continent, country;
