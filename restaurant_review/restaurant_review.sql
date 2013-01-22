-- restaurant_review.sql

CREATE TABLE Chef (
  chef_id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  mentor_id INTEGER,
  FOREIGN KEY (mentor_id) REFERENCES chef(chef_id)
);

CREATE TABLE Restaurant (
  rest_id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  neighborhood VARCHAR(255),
  cuisine VARCHAR(255)
);

CREATE TABLE HeadChefTenures (
  tenure_id INTEGER PRIMARY KEY,
  chef_id INTEGER,
  FOREIGN KEY chef_id REFERENCES Chef(chef_id)
  rest_id INTEGER,
  FOREIGN KEY rest_id REFERENCES Restaurant(rest_id)
  start_date DATE,
  end_date DATE,
);

CREATE TABLE Critic (
  critic_id INTEGER PRIMARY KEY,
  screen_name VARCHAR(255)
);

CREATE TABLE RestaurantReview (
  review_id INTEGER PRIMARY KEY,
  text_review TEXT,
  score INTEGER CHECK (score <= 20),
  date_of_review DATE
);