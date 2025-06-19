CREATE OR REPLACE FUNCTION update_updated_datetime()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_datetime = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_datetime
BEFORE UPDATE ON students
FOR EACH ROW
EXECUTE FUNCTION update_updated_datetime();

UPDATE students
SET primary_skill = 'Skill'
WHERE name = 'Name50000';
