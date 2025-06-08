INSERT INTO students(name, surname, date_of_birth, primary_skill, created_datetime, updated_datetime)
SELECT
  'Name' || gs::text AS name,
  'Surname' || gs::text AS surname,
  date '1990-01-01' + (random() * 10000)::int AS date_of_birth,
  'Skill' || (gs % 10)::text AS primary_skill,
  now() AS created_datetime,
  now() AS updated_datetime
FROM generate_series(1, 100000) gs;