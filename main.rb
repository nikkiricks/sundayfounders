     
require 'sinatra'
require 'pg'

if settings.development?
  require 'pry'
  require 'sinatra/reloader' 
  also_reload File.expand_path(__dir__, 'models/*')
  also_reload File.expand_path(__dir__, 'controllers/*')
end

def run_sql(sql, params = [])
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: "sundayfounders"})
  conn.prepare(sql, sql)
  records = conn.exec_prepared(sql, params)
  conn.close
  return records
end

def logged_in? #predicate method - returns a boolean
  return !!current_user #truthy
  # if current_user
  #   return true
  # else
  #   return false
  # end
end

def current_user
  find_one_user(session[:user_id])
end

require_relative 'models/investors'
require_relative 'models/ratings'
require_relative 'models/users' 

enable :sessions

@keyword = %w(Awesome Amazing Transparent).sample

get '/' do
  
  erb :index
end 



require_relative 'controllers/investors_controller'
require_relative 'controllers/ratings_controller'
require_relative 'controllers/login_controller'

# landing pages to use before site is live

get '/landing_page' do
  @keyword = %w(Awesome Amazing Transparent).sample
  erb :landing_page
end

post '/tell_me_more' do
  email, keyword = params[:email], params[:keyword]
  File.open("interest.csv", "a+") do |f|
    f.write "#{Time.now},#{email},#{keyword}\n "
  end

  redirect '/'
end










