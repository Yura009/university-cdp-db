ALTER TABLE students ADD CONSTRAINT check_name_special_characters
CHECK (name !~* '[@#%]');