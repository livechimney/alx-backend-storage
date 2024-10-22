-- Creates a stored procedure 'AddBonus' that
-- adds a new correction for a student
DELIMITER $$

DROP PROCEDURE IF EXISTS AddBonus;

CREATE PROCEDURE AddBonus(
    IN `user_id` INT,
    IN `project_name` VARCHAR(255),
    IN `score` DECIMAL(10, 2)
)
BEGIN
    -- Create the project if it doesn't exist
    INSERT INTO projects (name)
    SELECT project_name
    WHERE project_name NOT IN (SELECT name FROM projects);

    -- Add the correction
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, (SELECT id FROM projects WHERE name = project_name), score);
END $$

DELIMITER ;
