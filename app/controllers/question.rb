get '/questions' do
  @questions = Question.all
  erb :index
end

post '/questions' do
  erb :'/questions/new'
end

get '/questions/:question_id' do
  @question = Question.find_by(id: params[:question_id])

  erb :'/question/show'
end
