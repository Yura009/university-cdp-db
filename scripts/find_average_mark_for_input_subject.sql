CREATE OR REPLACE FUNCTION average_mark_for_subject(p_subject_name INT)
RETURNS NUMERIC AS $$
DECLARE
    average_mark NUMERIC;
BEGIN
    SELECT AVG(mark)
    FROM exam_results e
    JOIN subjects sub ON e.subject_id = sub.id
    WHERE sub.subject_name = p_subject_name;
    RETURN average_mark;
END;
$$ LANGUAGE plpgsql;