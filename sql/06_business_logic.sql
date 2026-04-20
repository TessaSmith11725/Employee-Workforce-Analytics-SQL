-- Business Logic
-- This file contains the GetStandardProfile stored function for role validation based on experience.

CREATE FUNCTION GetStandardProfile (role VARCHAR(50), experience INT)
RETURNS BOOLEAN AS
BEGIN
   RETURN (SELECT COUNT(*) > 0 FROM roles WHERE role_name = role AND required_experience <= experience);
END;
