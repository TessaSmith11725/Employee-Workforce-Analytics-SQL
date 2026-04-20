# Employee Workforce Analytics with SQL

## Overview

This project analyzes an employee database to support performance evaluation and workforce planning for a data science company.

Using SQL, the analysis focuses on:
- Employee performance ratings  
- Salary and bonus calculations  
- Reporting structure  
- Role alignment based on experience  

The goal is to generate insights that help HR make informed decisions during the employee appraisal process.

---

## Business Impact

This analysis helps HR teams:
- Improve employee performance evaluations  
- Identify employees who may need training or role adjustments  
- Better understand compensation and bonus costs  
- Support data-driven decision-making during appraisal cycles

---

## Key Insights

- Bonus calculations show that high-performing employees significantly impact compensation costs, highlighting the importance of performance-based budgeting  

- Department-level performance comparisons reveal variation in top ratings, suggesting differences in team performance or evaluation standards  

- Reporting structure analysis identifies managers with large numbers of direct reports, which may impact team efficiency and oversight  

---

## Tools Used

- SQL (MySQL)
- Data Modeling (ER Diagram)

---

## Dataset

The dataset includes:
- Employee records (demographics, salary, experience, ratings)
- Project assignments  
- Data science team roles  

## ER Diagram

![ER Diagram](./assets/2_ER_diagram.png)  

---

## Sample Outputs

This query compares each employee’s rating to the highest rating within their department, helping identify top performers and performance gaps.
```sql
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
```
![Employee_details](./assets/8_emp_rating.png)  

---

This query shows how bonuses are calculated based on ratings and salaries
```sql
-- Formula: 5% of salary * employee rating
SELECT
    emp_id,
    first_name,
    last_name,
    salary,
    emp_rating,
    (salary * 0.05) * emp_rating AS bonus
FROM emp_records;
```
![Employee_bonuses](./assets/15_bonus.png)  

---
