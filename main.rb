     
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

post '/create_investor' do

  create_investor(params[:name], params[:url], params[:logo_url], params[:portfolio_size], params[:fum] )
  
  #make a new request on behalf of the client
  # redirect is a get /
  redirect '/investors'

end

get '/investor_details' do
  @investor = find_one_investor(params[:id])
  @user = find_one_user(params[:user_id])
  @investor_ratings = find_one_rating_review(params[:id])
  erb :investor_details
end

patch '/update_investor' do
  update_investor(params[:id])

  redirect '/'
  # redirect "/investor_details?id=#{params[:id] }"
end

delete '/delete_investor' do
  delete_investor(params[:id] )

  redirect '/investors'
end

post '/rate_review' do

  rate_review(params[:investor_id], params[:user_id], params[:rating], params[:review] )
  #make a new request on behalf of the client
  # redirect is a get /
  redirect "/investor_details?id=#{params[:id] }"

end


get '/signup' do
 
  erb :signup
end

post '/signup' do

  create_user(params[:email], params[:bio] )

  redirect '/investors'
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
    return "It's in the database but it doesn't work"
  end
  # redirect to secret location
  redirect "/investors"
end

delete '/logout' do
  session[:user_id] = nil
  redirect "/login"
end



#pages for later


# erb psydocode

# figure out passwords
# figure out log in first as posting on investor page will need user_id

# investor_details

#once able to post 

# Loop through all of investor_ratings to get the rating for that specific investor, this needs to include an if statement specific to investor_id ADD CODE IN LATER:

# <div >  
#   <% @investor_ratings.each do |user| %> 
#     <div>
#       <h3><%= user[rating] %> </h3>
#     <%  <p><%= user["review"] %></p> 
#     </div>
#     <% end %>
# </div> 










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








