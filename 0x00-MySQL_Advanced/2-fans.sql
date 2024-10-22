-- Create a tmp file to store the aggregated fan counts by origin
CREATE TEMPORARY TABLE temp_fan_counts AS
SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin;

-- Rank the origins based on total fans
SELECT origin, nb_fans
FROM temp_fan_counts
ORDER BY nb_fans DESC;
