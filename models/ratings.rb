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

def rate_review (investor_id, user_id, rating, review)
  return run_sql("INSERT INTO investor_ratings (investor_id, user_id, rating, review) VALUES (#{investor_id}, #{user_id}, #{rating}, '#{review}') ")
end