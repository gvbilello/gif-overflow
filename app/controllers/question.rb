get '/questions' do
  @questions = Question.all.reverse
  erb :index
end

post '/questions' do
  # binding.pry
  @question = Question.new(title: params[:title], description: params[:description], author: User.find_by(id: session["user_id"]))
  if @question.save
    # do good things
    status 200
    # go smwhr nice
    # binding.pry
    erb :'/question/_question', locals: {question: @question}, layout: false
  else
    # error messages!!!
    status 404
    erb :index
  end
end

get '/questions/:question_id' do
  @question = Question.find_by(id: params[:question_id])
  @answers = Answer.where(question_id: params[:question_id])
  erb :'/question/show'
end
