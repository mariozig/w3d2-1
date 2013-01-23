-- restaurant_review.sql

CREATE TABLE chefs (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  mentor_id INTEGER
);

CREATE TABLE restaurants (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  neighborhood VARCHAR(255),
  cuisine VARCHAR(255)
);

CREATE TABLE head_chef_tenures (
  id INTEGER PRIMARY KEY,
  chef_id INTEGER,
  rest_id INTEGER,
  start_date DATE,
  end_date DATE
);

CREATE TABLE critics (
  id INTEGER PRIMARY KEY,
  screen_name VARCHAR(255)
);

CREATE TABLE restaurant_reviews (
  id INTEGER PRIMARY KEY,
  critic_id INTEGER,
  rest_id INTEGER,
  review TEXT,
  score INTEGER CHECK (score <= 20),
  review_date DATE
);

INSERT INTO chefs ('first_name', 'last_name', 'mentor_id')
  VALUES ('Anthony', 'Bourdain', '1'),
         ('John', 'McCain', '1'),
         ('Tom', 'Terriffic', '2');

INSERT INTO restaurants ('name', 'neighborhood', 'cuisine')
  VALUES ('Red Robin', 'The Mission', 'American'),
         ('Purple Dragon', 'The Castro', 'Chinese'),
         ('Taco Bell', 'Financial District', 'Sort-of Mexican');

INSERT INTO head_chef_tenures ('chef_id', 'rest_id', 'start_date', 'end_date')
  VALUES ('1', '3', '2001-12-22', '2003-08-27'),
         ('1', '2', '2004-02-03', '2009-08-01'),
         ('2', '3', '2003-08-29', '2008-03-15'),
         ('3', '1', '2000-01-12', '2010-02-14'),
         ('3', '2', '2010-06-22', '2012-10-31');

INSERT INTO critics ('screen_name')
  VALUES ('florence_felch'),
         ('helluva_bottom_carter'),
         ('lady_vulvamorte');

INSERT INTO restaurant_reviews ('critic_id', 'rest_id', 'review', 'score', 'review_date')
  VALUES ('1', '3','really Anthony? you call that cooking? i couldnt even put that grease into my mouth, and i put A LOT of things in my mouth...', '1', '2002-03-04'),
         ('2', '3', 'while walking to my car i saw the chef smoking rocks...nuff said, but must say that the taquitos were scrum-diddly-umptious!', '2', '2008-01-15');