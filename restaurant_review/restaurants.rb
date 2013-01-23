require 'singleton'
require 'sqlite3'

class RestaurantDatabase < SQLite3::Database
  include Singleton

  def initialize
    # tell the SQLite3::Database the db file to read/write
    super("restaurant.db")

    # otherwise we get an array of values
    self.results_as_hash = true
    # otherwise everything is returned as a string
    self.type_translation = true
  end
end


def find_restaurant(neighborhood)
  RestaurantDatabase.instance.execute("SELECT * FROM restaurants WHERE neighborhood = (?)", neighborhood)
end

def find_reviews(critic)
  RestaurantDatabase.instance.execute("SELECT review, score, review_date FROM restaurant_reviews JOIN critics ON restaurant_reviews.critic_id = critics.id WHERE screen_name = (?)", critic)
end

def find_critic_avg(critic)
  RestaurantDatabase.instance.execute("SELECT AVG(score) AS score_average FROM restaurant_reviews JOIN critics ON restaurant_reviews.critic_id = critics.id WHERE screen_name = (?)", critic)
end

def list_reviews(restarant)
  RestaurantDatabase.instance.execute("SELECT review, score, review_date FROM restaurant_reviews JOIN restaurants ON restaurant_reviews.rest_id = restaurants.id WHERE name = (?)", restaurant)
end

def find_restaurant_avg(restaurant)
  RestaurantDatabase.instance.execute("SELECT AVG(score) AS score_average FROM restaurant_reviews JOIN restaurants ON restaurant_reviews.rest_id = restaurants.id WHERE name = (?)", restaurant)
end

def average_review(chef)
  RestaurantDatabase.instance.execute("SELECT AVG(score) AS average_score
    FROM( SELECT score, head_chef_tenures.chef_id
        FROM restaurant_reviews JOIN head_chef_tenures
       USING (rest_id)
       WHERE restaurant_reviews.review_date BETWEEN start_date AND end_date )
    JOIN chefs
    ON chef_id = chefs.id
    WHERE chefs.first_name = (?)", chef)
end

def number_proteges(chef)
  RestaurantDatabase.instance.execute("SELECT COUNT(c1.mentor_id) AS proteges FROM chefs c1 JOIN chefs c2 ON c1.mentor_id = c2.id WHERE c2.first_name = (?)", chef)
end
