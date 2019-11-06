def run_sql(sql)
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: "sundayfounders"})
  records = conn.exec(sql)
  conn.close
  return records
end

def all_ratings_reviews()
  return run_sql( "SELECT * FROM investor_ratings;") 
end

def find_one_rating_review(id)
  return nil unless id #guard condition - early return 
  return run_sql("SELECT * FROM investor_ratings WHERE id = #{id};").first
end

def rate_review (investor_id, rating, review)
  return run_sql("INSERT INTO investor_ratings (investor_id, rating, review) VALUES (#{investor_id}, #{rating}, '#{review}');")
end

def find_all_ratings_by_investor_id (id)
  return run_sql ("SELECT * FROM investor_ratings WHERE investor_id = #{id};")
end

def find_only_ratings_by_investor_id (id)
  return run_sql ("SELECT rating FROM investor_ratings WHERE investor_id = #{id};")
end

# use once user login is figured out

# def rate_review (investor_id, user_id, rating, review)
#   return run_sql("INSERT INTO investor_ratings (investor_id, user_id, rating, review) VALUES (#{investor_id}, #{user_id}, #{rating}, '#{review}');")
# end

