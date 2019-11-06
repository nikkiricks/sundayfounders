     
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
require_relative 'models/ratings'
require_relative 'models/users' 

enable :sessions


get '/' do
  erb :index
end 


post '/rate_review' do

  # for the form WORKING DON'T TOUCH:
  @investor_ratings = find_one_rating_review(params[:id])
  @investor = find_one_investor(params[:id])
  #@user = find_one_user(params[:id])

  #code with user_id
  #rate_review(params[:investor_id], params[:user_id], params[:rating], params[:review] )
  #insert code to erb form at the end of the input lines:   <input type="hidden" name="user_id" value="<%=@user["id"]%>">

  # code without the user_id
  rate_review(params[:investor_id], params[:rating], params[:review] )
  #make a new request on behalf of the client
  # redirect is a get /
  redirect "/investor_details?id=#{params[:id] }"

end

get '/profile' do
  @user = find_one_user(params[:id])
  # session[:user_id] = user["id"]
  # once user is logged in
  # have user_dashboard show nav bar anchor <a href="/profile">Profile</a>
  # insert email of user at the top
  # possibly have another form for the user to insert/post more information about themselves like Name, City, Gender, Industry, etc.
  erb :profile
end




require_relative 'controllers/investors_controller'
require_relative 'controllers/login_controller'

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



# filler text

# <h3>2</h3>
# <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit quas quo dicta sit? Asperiores architecto quia beatae quas pariatur provident? Quia quisquam, eligendi nihil dolor alias adipisci neque dignissimos temporibus!</p>

# <h3>4</h3>
# <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Voluptatem corporis quas illo! Quis dignissimos iure sequi nisi. Ratione, dolore! Accusantium, est quo. Vel recusandae porro deleniti et sapiente, pariatur nulla!</p>

# <h3>3</h3>
# <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Obcaecati cupiditate inventore nemo incidunt corrupti ducimus ad rem, distinctio ullam rerum totam repudiandae possimus eum sint temporibus ipsam, consectetur deleniti perspiciatis?</p>







