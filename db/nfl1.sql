CREATE TABLE states(
  id INTEGER PRIMARY KEY,
  name TEXT,
  abbr TEXT,
  capital TEXT,
  biggest_city TEXT,
  population INTEGER,
  area INTEGER
);
CREATE TABLE cities(
  id INTEGER PRIMARY KEY,
  name TEXT,
  population_2013 INTEGER,
  population_2010 INTEGER,
  population_change REAL,
  population_density INTEGER,
  state_id INTEGER
);
CREATE TABLE teams(
  id INTEGER PRIMARY KEY,
  name TEXT,
  wins INTEGER,
  losses INTEGER,
  ties INTEGER,
  division TEXT,
  conference TEXT,
  playoff BOOLEAN,
  city_id INTEGER
);

SELECT * FROM teams WHERE conference = 'NFC' AND division = 'North';

SELECT * FROM teams WHERE wins >= '11';

SELECT * FROM teams WHERE wins >= '8' AND playoff = '0';

UPDATE teams SET name= "Losers"
   ...> SELECT * FROM teams WHERE wins < '4';

SELECT cities.name, teams.name WHERE cities.id, teams.city_id AND cities.population_2013 < 5000000;;

SELECT teams.conference, cities.population_change FROM 



