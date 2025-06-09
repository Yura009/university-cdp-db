CREATE OR REPLACE FUNCTION students_in_red_zone()
RETURNS TABLE(student_id INT, name VARCHAR, surname VARCHAR, low_marks_count INT) as $$
BEGIN
    RETURN QUERY
    SELECT s.id, s.name, s.surname, COUNT(e.mark) as low_marks_count
    FROM students s
    JOIN exam_results e ON s.id = e.student_id
    WHERE e.mark <= 3
    GROUP BY s.id, s.name, s.surname
    HAVING COUNT(e.mark) >= 2;
END;
$$ LANGUAGE plpgsql;