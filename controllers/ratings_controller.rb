post '/rate_review' do
  rate_review(params[:investor_id], current_user["id"], params[:rating], params[:review])

  redirect "/investor_details?id=#{params[:investor_id] }"
end