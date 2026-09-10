CREATE table newest AS
  SELECT title, year
  from titles
  order by year desc 
  limit 10;


CREATE table dog_movies AS 
  SELECT t.title, p.character
  from titles t 
  join principals p 
    on 
      t.tconst = p.tconst
  where 
    p.character like '%dog%';


CREATE table leads AS 
  select n.name, count(1) as lead_roles 
  from names n 
  join principals p 
    on n.nconst = p.nconst 
  where 
    p.ordering = 1 
  group by 1 
  having count(1) > 10 
  order by 2 desc;


CREATE table long_movies AS 
  select ((year / 10) || '0s') as decade, count(1) as count
  from titles 
  where 
    runtime > 180
  group by 1;

