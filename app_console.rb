require 'pg'
require 'pry'

def run_sql(sql)
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: "sundayfounders"})
  records = conn.exec(sql)
  conn.close
  return records
end

require_relative 'models/investors'
require_relative 'models/ratings'
require_relative 'models/users' 

binding.pry