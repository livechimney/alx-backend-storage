-- Computes and store the average score for each name
CREATE INDEX idx_name_first
ON names (name(1));
