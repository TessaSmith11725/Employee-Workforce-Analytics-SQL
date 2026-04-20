-- Views and Indexes
-- This file contains view creation and index optimization queries.

CREATE VIEW employee_salary_view AS
SELECT employee_id, first_name, last_name, salary
FROM employees;

CREATE INDEX idx_salary ON employees(salary);
