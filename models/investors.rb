def run_sql(sql)
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: "sundayfounders"})
  records = conn.exec(sql)
  conn.close
  return records
end




def all_investors()
  return run_sql( "SELECT * FROM investors;") 
end

def find_one_investor(id)
  return run_sql("SELECT * FROM investors WHERE id = #{id};").first
end


