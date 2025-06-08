EXPLAIN ANALYZE
SELECT * FROM students WHERE name='Name5000';

EXPLAIN ANALYZE
SELECT * FROM students WHERE surname LIKE '%123%';

EXPLAIN ANALYZE
SELECT s.*, p.phone_number
FROM students s
JOIN phones p ON s.id = p.student_id
WHERE p.phone_number LIKE '%063%';

EXPLAIN ANALYZE
SELECT s.*, e.mark
FROM students s
JOIN exam_results e ON s.id = e.student_id
WHERE s.surname LIKE '%123%';