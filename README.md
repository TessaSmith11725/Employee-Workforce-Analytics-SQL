📊 Employee Database SQL Analysis
📌 Overview

This project analyzes an employee database to extract insights on workforce structure, performance, and compensation. It demonstrates SQL proficiency across data retrieval, aggregation, window functions, and business logic implementation.

🛠 Tools Used
SQL (MySQL)
Data Modeling (ER Diagram)
📂 Dataset
Employee records
Project assignments
Data science team structure
🔍 Key Analyses
Employee performance segmentation by rating
Department-level performance benchmarking
Manager-reporting structure analysis
Salary distribution by geography
Experience-based ranking system
Business rule validation using stored functions
⭐ Featured Insight

A stored function was created to validate whether employee roles align with organizational standards based on experience:

IF(role = GetStandardProfile(EXP), 'MATCH', 'MISMATCH')

This highlights mismatches between assigned roles and expected career progression.

📈 Key Skills Demonstrated
Joins & subqueries
Window functions (DENSE_RANK, MAX OVER)
Views & indexing
Stored procedures/functions
Data validation logic
🧱 ER Diagram
assets/2_ER_diagram.png
