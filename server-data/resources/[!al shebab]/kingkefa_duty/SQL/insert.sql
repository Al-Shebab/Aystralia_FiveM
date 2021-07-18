INSERT INTO `jobs` (name, label) VALUES
  ('offpolice','Außer Dienst'),
  ('offambulance','Außer Dienst')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice',0,'recruit','Außer Dienst',20,'{}','{}'),
  ('offpolice',1,'officer','Außer Dienst',20,'{}','{}'),
  ('offpolice',2,'sergeant','Außer Dienst',20,'{}','{}'),
  ('offpolice',3,'lieutenant','Außer Dienst',20,'{}','{}'),
  ('offpolice',4,'boss','Außer Dienst',20,'{}','{}')
;