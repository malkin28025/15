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