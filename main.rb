     
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

if settings.development?
  require 'sinatra/reloader' 
  also_reload 'models/*' 
  require 'pry'
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
require_relative 'models/users' 
require_relative 'models/ratings'

enable :sessions


get '/' do
  erb :index
end 

get '/investors' do

  @investors = all_investors()

  erb :investors
end

get '/investor_details' do
  @investor = find_one_investor(params[:id])
  @investor_ratings = find_one_rating_review(params[:id])
  erb :investor_details
end

post '/rate_review' do

  rate_review(params[:rating], params[:review] )
  #make a new request on behalf of the client
  # redirect is a get /
  redirect "/investor_details?id=#{params[:id] }"

end

get '/signup' do
 
  erb :signup
end

post '/signup' do

  create_user(params[:email], params[:bio] )

  redirect '/'
end


get '/login' do
  
  erb :login

end

post '/login' do
  # check Bryan's account exists in the db
  user = find_user_by_email(params[:email])
  if BCrypt::Password.new(user["password_digest"]) == params[:password]
    # check password is valid
    # create a session for Bryan - writing something down in memory
    # write down id of login user (we usually say create a session for the user)
    session[:user_id] = user["id"] #single source of truth
    # redirect to secret location
    redirect "/" #eventually have user go to user dashboards
  else
    return "no bryan"
  end
  # redirect to secret location
  redirect "/"
end

delete '/logout' do
  session[:user_id] = nil
  redirect "/login"
end



#pages for later


# pages I probably won't use

get '/landing_page' do
  @keyword = %w(Awesome Amazing Transparent).sample
  erb :landing_page
end

post '/tell_me_more' do
  email, keyword = params[:email], params[:keyword]
  File.open("interest.csv", "a+") do |f|
    f.write "#{Time.now},#{email},#{keyword}\n "
  end

  erb :thanks
end








