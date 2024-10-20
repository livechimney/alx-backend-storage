-- Create a srored procedure 'ComputeAverageScoreForUser'
-- that computes the average score for the user
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(
    IN user_id INT
    )
BEGIN DECLARE avg_score FLOAT;
    -- Calculates the average score
    SET avg_score = (
        SELECT AVG(score)
    FROM corrections AS C WHERE C.user_id = user_id);
    -- Update the user's average score
    UPDATE users
    SET average_score = avg_score
    WHERE id = user_id;
END
$$
DELIMITER ;
