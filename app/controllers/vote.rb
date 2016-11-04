post '/votes' do
  @vote = Vote.new(voter: current_user, voteable_id: params[:question_id].to_i, voteable_type: params[:type], vote_direction: params[:vote_direction].to_i)
  if @vote.save
    # good things
    status 200
    content_type :json
    {points: Question.find_by(id: params[:question_id]).points, question_id: params[:question_id]}.to_json
    # binding.pry
    # puts "hey!"
  else
    # bad things
    status 404
  end
end
