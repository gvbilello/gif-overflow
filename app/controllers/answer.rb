post '/questions/:question_id/answers' do
  @question = Question.find_by(id: params[:question_id])

  if request.xhr?
    @answer =Answer.new(gif: params[:response], question: @question, answerer: current_user)
    if @answer.save
      # binding.pry
      erb :'/question/_answerform', layout: false
    end
      # binding.pry
  else
    erb :"question/show"
  end
end
