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
  @user = find_one_user(params[:id])
  @investor_ratings = find_one_rating_review(params[:id])
  @all_investor_ratings = find_all_ratings_by_investor_id(params[:id])
  @investor_ratings_only = find_only_ratings_by_investor_id(params[:id])


  #TRYING TO FIGURE OUT AVERAGE TOTAL:

  # raise @investor_ratings_only.to_a.to_s
  #(each do |rating| investor[:rating] end)

  # raise @investor_ratings_only.each do |rating|
  #   return rating[].sum
  # end

  # arr.each do |rating|
  #   rating.sum
  # end
  # #=> TypeError: Array can't be coerced into Integer

  # arr.each do |rating|
  #   [rating].sum
  # end
  # # TypeError: Hash can't be coerced into Integer

  # arr.each do |rating|
  #   [rating].sum
  # end
  # TypeError: Hash can't be coerced into Integer

#   [19] pry(main)> arr[0]["rating"].to_i + arr[1]["rating"].to_i
# => 6
# [20] pry(main)> arr.length
# => 6


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
