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
    return "No frynuts"
  end
  # redirect to secret location

  redirect "/"
end

delete '/logout' do
  session[:user_id] = nil
  redirect "/login"
end

get '/my_ratings' do
  @list_all_user_ratings_reviews = all_user_ratings_reviews(session[:user_id])
  # @user = find_one_user(params[:id])
  # session[:user_id] = user["id"]
  # once user is logged in
  # possibly have another form for the user to insert/post more information about themselves like Name, City, Gender, Industry, etc.
  erb :my_ratings
end

delete '/delete_rating' do
  delete_one_rating(params[:id])

  # @list_all_user_ratings_reviews = all_user_ratings_reviews(session[:user_id])

  redirect '/my_ratings'
end

get '/settings' do

  erb :settings
end

patch '/update_user' do
  update_user(params[:id])

  redirect '/settings'
end

delete '/delete_user' do
  #session[:user_id] = nil
  delete_user(params[:email])
  session[:user_id] = nil
  # Add in once I figure out the delete feature
  redirect "/investors"
end