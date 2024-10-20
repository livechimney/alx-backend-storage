-- Create a stored procedure 'ComputerAverageWeightedScoreForUser'
-- that computes and stores the average weighted score for a student
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(user_id INT)
BEGIN
    DECLARE avg_score FLOAT;
    -- Calculates the weighted score
    SELECT SUM(score * projects.weight) / SUM(projects.weight)
    INTO avg_score
    FROM corrections
    INNER JOIN projects
    ON corrections.project_id = projects.id
    WHERE user_id = user_id;
    -- Update the user's average score
    UPDATE users
    SET average_score = avg_score
    WHERE id = user_id;
END $$
DELIMITER ;
