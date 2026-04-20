-- Business Logic
-- This file contains the GetStandardProfile stored function for role validation based on experience.

-- Create a stored function to validate whether assigned job profiles
-- match the organization's standard based on experience.

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

