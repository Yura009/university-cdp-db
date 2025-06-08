CREATE TABLE IF NOT EXISTS students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    primary_skill VARCHAR(255),
    created_datetime TIMESTAMP NOT NULL,
    updated_datetime TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS phones(
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES students(id) ON DELETE CASCADE,
    phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS subjects(
    id SERIAL PRIMARY KEY,
    subject_name VARCHAR(255) NOT NULL,
    tutor VARCHAR(255),
    description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS exam_results(
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES students(id) ON DELETE CASCADE,
    subject_id INT NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    mark INT NOT NULL CHECK (mark BETWEEN 1 AND 5)
);