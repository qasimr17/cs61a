CREATE TABLE parents (parent TEXT, child TEXT);

INSERT INTO parents VALUES
  ('ace', 'bella'),
  ('ace', 'charlie'),
  ('daisy', 'hank'),
  ('finn', 'ace'),
  ('finn', 'daisy'),
  ('finn', 'ginger'),
  ('ellie', 'finn');

CREATE TABLE dogs (name TEXT, fur TEXT, height INTEGER);

INSERT INTO dogs VALUES
  ('ace',     'long',  26),
  ('bella',   'short', 52),
  ('charlie', 'long',  47),
  ('daisy',   'long',  46),
  ('ellie',   'short', 35),
  ('finn',    'curly', 32),
  ('ginger',  'short', 28),
  ('hank',    'curly', 31);

CREATE TABLE sizes (size TEXT, min INTEGER, max INTEGER);

INSERT INTO sizes VALUES
  ('toy',      24, 28),
  ('mini',     28, 35),
  ('medium',   35, 45),
  ('standard', 45, 60);


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT p.child 
  from parents p 
  join dogs d 
    on p.parent = d.name 
  order by d.height desc;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name, s.size
  from dogs d 
  join sizes s 
  where 
    d.height > s.min and 
    d.height <= s.max;


-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
  SELECT a.child as sib1, b.child as sib2 
  from parents a 
  join parents b 
    on 
      a.parent = b.parent and 
      a.child < b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT  
    'The two siblings, ' || sib1 || ' and ' || sib2 || ', have the same size: ' || a.size as sentence
    from siblings sib
    join size_of_dogs a on sib.sib1 = a.name
    join size_of_dogs b on sib.sib2 = b.name
    where a.size = b.size;;

-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  select 
    fur, max(height) - min(height) as height_range
  from (
    select
      d.*, temp.avg_height, d.height between 0.7 * temp.avg_height and 1.3 * temp.avg_height as within_range
    from dogs d 
    join (
      select fur, avg(height) as avg_height
      from dogs d 
      group by 1 
    ) as temp 
    on d.fur = temp.fur
  )
  group by 1 
  having count(1) = sum(within_range);

