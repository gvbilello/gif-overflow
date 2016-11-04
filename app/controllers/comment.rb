post '/questions/:question_id/comments' do
  @question = Question.find_by(id: params[:question_id])
  # binding.pry
  if request.xhr?
    @comment = Comment.new(response: params[:comment_text], commentable_id: params[:question_id], commentable_type: "Question", commenter: current_user)
    if @comment.save
      erb :'/question/_questioncommentform', layout: false
    end
  end

end

post '/answers/:answer_id/comments' do
end

