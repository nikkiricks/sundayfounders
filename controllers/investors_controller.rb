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
  investor_id = params[:id]
  @investor = find_one_investor(investor_id)
  @user = current_user
  @investor_ratings = find_one_rating_review(investor_id)
  @all_investor_ratings = find_all_ratings_by_investor_id(investor_id)
  @investor_ratings_only = investor_avg_rating_by_id(investor_id)

  erb :investor_details
end

patch '/update_investor' do
  update_investor(params[:id])

  redirect "/investor_details?id=#{params[:id] }"
end

delete '/delete_investor' do
  delete_investor(params[:id] )

  redirect '/investors'
end
