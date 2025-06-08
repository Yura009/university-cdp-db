DO $$
BEGIN
  FOR i IN 1..100000 LOOP
    INSERT INTO students(name, surname, date_of_birth, primary_skill, created_datetime, updated_datetime)
    VALUES (
      'Name' || i,
      'Surname' || i,
      date '2000-01-01' + (random() * 3650)::int,
      'Skill' || (i % 10),
      now(),
      now()
    );
  END LOOP;
END
$$;