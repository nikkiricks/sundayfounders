get '/signup' do
 
  erb :signup
end

post '/signup' do

  create_user(params[:email], params[:password_digest] )

  redirect "/profile?id=#{params[:id]}"
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

