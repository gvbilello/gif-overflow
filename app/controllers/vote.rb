post '/votes' do
  @vote = Vote.new(voter: current_user, voteable_id: params[:question_id].to_i, voteable_type: params[:type], vote_direction: params[:vote_direction].to_i)

  if @vote.save
    status 200
    content_type :json
    {points: Question.find_by(id: params[:question_id]).points, question_id: params[:question_id]}.to_json
  else
    status 404
  end
end

post '/answers/:id/votes' do
  binding.pry
  @vote = Vote.new(voter: current_user, voteable_id: params[:answer_id].to_i, voteable_type: params[:type], vote_direction: params[:vote_direction].to_i)
  if @vote.save
    status 200
    content_type :json
    {points: Answer.find_by(id: params[:answer_id]).points, answer_id: params[:answer_id]}.to_json
  else
    status 404
  end
end
