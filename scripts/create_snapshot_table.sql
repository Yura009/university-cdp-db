CREATE TABLE students_marks_snapshot(
    id SERIAL PRIMARY KEY,
    student_name VARCHAR(255),
    student_surname VARCHAR(255),
    subject_name VARCHAR(255),
    mark INT NOT NULL CHECK (mark BETWEEN 1 AND 5),
    snapshot_datetime TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION snapshot_exam_result()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO students_marks_snapshot(student_name, student_surname, subject_name, mark)
  SELECT s.name, s.surname, sub.subject_name, NEW.mark
  FROM students s, subjects sub
  WHERE s.id = NEW.student_id AND sub.id = NEW.subject_id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_snapshot_exam_results
AFTER INSERT OR UPDATE ON exam_results
FOR EACH ROW
EXECUTE FUNCTION snapshot_exam_result();