INSERT INTO exam_results(student_id, subject_id, mark)
SELECT
  (random() * 99999 + 1)::int AS student_id,
  (random() * 999 + 1)::int AS subject_id,
  (random() * 4 + 1)::int AS mark
FROM generate_series(1, 1000000);