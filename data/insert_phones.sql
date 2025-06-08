INSERT INTO phones(student_id, phone_number)
SELECT id, '+380' || LPAD((TRUNC(RANDOM() * 1000000000))::TEXT, 9, '0')
FROM students;