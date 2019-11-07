get '/signup' do
 
  erb :signup
end

post '/signup' do

  create_user(params[:email], params[:password] )
  user = find_user_by_email(params[:email])
  session[:user_id] = user["id"] #single source of truth
  # redirect '/'
  redirect '/investors'

  # redirect "/profile"
end


get '/login' do
  
  erb :login

end

post '/login' do
  # check Bryan's account exists in the db
  user = find_user_by_email(params[:email])
  # return (params[:password])
  if BCrypt::Password.new(user["password_digest"]) == params[:password]
    # check password is valid
    # create a session for Bryan - writing something down in memory
    # write down id of login user (we usually say create a session for the user)
    session[:user_id] = user["id"] #single source of truth
    # redirect to secret location
    # "/profile?id=#{params[:id]}"
    redirect "/my_ratings" #eventually have user go to user dashboards
  else
    return "It's in the database but it doesn't work"
  end
  # redirect to secret location

  redirect "/"
end

delete '/logout' do
  session[:user_id] = nil
  redirect "/login"
end

delete '/delete_user' do
  # session[:user_id] = nil
  @delete_user = delete_user(params[:id])

  # Add in once I figure out the delete feature

#   <form action="/delete_user" method="post">
#   <input type="hidden" name="_method" value="delete">
#   <input type="hidden" name="id" value="<%= @delete_user["id"]%>">
#   <button>delete</button>
# </form>

  redirect "/investors"
end

