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

def create_investor (name, url, logo_url, portfolio_size, fum)
  return run_sql("INSERT INTO investors (name, url, logo_url, portfolio_size, fum) VALUES ('#{name} ', ' #{url} ', '#{logo_url} ', ' #{portfolio_size} ', ' #{fum} ') ")
end

def  update_investor (id)
  return run_sql("UPDATE investors SET name = '#{params[:name]}', url = '#{params[:url]}', logo_url = '#{params[:logo_url]}', portfolio_size = '#{params[:portfolio_size]}', fum = '#{params[:fum]}' WHERE id = #{params[:id]};")
end

def delete_investor (id)
  return run_sql( "DELETE FROM investors WHERE id = #{id};")
end