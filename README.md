# Employee Workforce Analytics with SQL

## Executive Summary

This project analyzes an employee database to support performance evaluation and workforce planning for a data science company.

Using SQL, the analysis focuses on:
- Employee performance ratings  
- Salary and bonus calculations  
- Reporting structure  
- Role alignment based on experience  

The goal is to generate insights that support data-driven decisions during the employee appraisal process.

---

## Business Impact

This analysis enables HR teams to:
- Improve employee performance evaluations  
- Identify employees who may need training or role adjustments  
- Better understand compensation and bonus costs  
- Support data-driven decision-making during appraisal cycles  

---

## Key Insights

- Departments show variation in maximum performance ratings, suggesting differences in performance standards or team effectiveness  

- Bonus calculations highlight that high-performing employees significantly increase compensation costs  

- Managers with a high number of direct reports may face challenges in oversight and team performance  

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

---

## ER Diagram

The diagram below illustrates the structure and relationships between the core tables used in this analysis.

![ER Diagram](./assets/2_ER_diagram.png)

---

## Sample Outputs

### Max Employee Rating by Department

Compares each employee’s rating to the highest rating within their department, helping identify top performers and performance gaps.

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

### Business Logic and Stored Functions

Creates a stored function to validate whether assigned job profiles match the organization's standard based on experience.

```sql
DELIMITER //

CREATE FUNCTION GetStandardProfile(exp INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE standard_role VARCHAR(50);

    CASE
        WHEN exp <= 2 THEN
            SET standard_role = 'JUNIOR DATA SCIENTIST';
        WHEN exp > 2 AND exp <= 5 THEN
            SET standard_role = 'ASSOCIATE DATA SCIENTIST';
        WHEN exp > 5 AND exp <= 10 THEN
            SET standard_role = 'SENIOR DATA SCIENTIST';
        WHEN exp > 10 AND exp <= 12 THEN
            SET standard_role = 'LEAD DATA SCIENTIST';
        ELSE
            SET standard_role = 'MANAGER';
    END CASE;

    RETURN standard_role;
END //

DELIMITER ;

SELECT
    emp_id,
    first_name,
    last_name,
    role AS assigned_role,
    exp,
    GetStandardProfile(exp) AS standard_role,
    IF(role = GetStandardProfile(exp), 'MATCH', 'MISMATCH') AS status_check
FROM data_science_team;
```
![Employee_Validation](./assets/13_delimiter.png)
---
