post '/rate_review' do

  # for the form WORKING DON'T TOUCH:
  # @investor_ratings = find_one_rating_review(params[:id])
  # @investor = find_one_investor(params[:id])
  # @user = current_user

  #code with user_id
  rate_review(params[:investor_id], current_user["id"], params[:rating], params[:review])
  #insert code to erb form at the end of the input lines:   <input type="hidden" name="user_id" value="<%=@user["id"]%>">

  # code without the user_id
  # rate_review(params[:investor_id], params[:rating], params[:review] )
  #make a new request on behalf of the client
  # redirect is a get /
  redirect "/investor_details?id=#{params[:investor_id] }"

end