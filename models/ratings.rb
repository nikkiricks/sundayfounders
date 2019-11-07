def all_ratings_reviews()
  return run_sql( "SELECT * FROM investor_ratings;") 
end

def find_one_rating_review(id)
  return nil unless id #guard condition - early return 
  return run_sql("SELECT * FROM investor_ratings WHERE id = #{id};").first
end


def find_all_ratings_by_investor_id (id)
  return run_sql ("SELECT * FROM investor_ratings WHERE investor_id = #{id};")
end


def rate_review (investor_id, user_id, rating, review)
  return run_sql("INSERT INTO investor_ratings (investor_id, user_id, rating, review) VALUES (#{investor_id}, #{user_id}, #{rating}, '#{review}');")
end

def all_user_ratings_reviews (id)
  return run_sql("SELECT * FROM investor_ratings WHERE user_id = #{id};")
end

def delete_one_rating (id)
  return run_sql( "DELETE FROM investor_ratings WHERE id = #{id};")
end

# This is getting back all investor id

def investor_avg_rating_by_id (id)
  return run_sql("SELECT to_char(AVG(rating),'9D9') FROM investor_ratings WHERE investor_id = #{id};")
end