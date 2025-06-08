CREATE INDEX idx_students_name_btree ON students(name);
CREATE INDEX idx_students_name_hash ON students USING HASH(name);


CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE INDEX idx_students_surname_trgm ON students USING GIN (surname gin_trgm_ops);

CREATE INDEX idx_phones_number_trgm ON phones USING GIN (phone_number gin_trgm_ops);

CREATE INDEX idx_students_surname_gist ON students USING GIST (surname gist_trgm_ops);

CREATE INDEX idx_phones_student_id ON phones(student_id);
CREATE INDEX idx_exam_results_student_id ON exam_results(student_id);
CREATE INDEX idx_exam_results_subject_id ON exam_results(subject_id);