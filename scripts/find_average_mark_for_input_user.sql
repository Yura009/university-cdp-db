CREATE OR REPLACE FUNCTION average_mark_for_user(p_student_id INT)
RETURNS NUMERIC AS $$
DECLARE
    average_mark NUMERIC;
BEGIN
    SELECT AVG(mark)
    FROM exam_results
    WHERE student_id = p_student_id;
    RETURN average_mark;
END;
$$ LANGUAGE plpgsql;