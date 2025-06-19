INSERT INTO subjects(subject_name, tutor, description)
SELECT
  'Subject ' || gs::text,
  'Tutor ' || (gs % 50)::text,
  'Description for subject ' || gs::text
FROM generate_series(1, 1000) gs;