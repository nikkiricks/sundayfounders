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
  # testing code
  # "investor id is: #{(params[:id])}" 
  @investor = find_one_investor(params[:id])
  @user = find_one_user(params[:user_id])
  @investor_ratings = find_one_rating_review(params[:id])
  erb :investor_details
end

patch '/update_investor' do
  update_investor(params[:id])

  # redirect '/'
  redirect "/investor_details?id=#{params[:id] }"
end

delete '/delete_investor' do
  delete_investor(params[:id] )

  redirect '/investors'
end
