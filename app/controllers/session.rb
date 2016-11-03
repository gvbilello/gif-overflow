get '/sessions/new' do
   erb :'session/new'
end

post '/sessions' do
  @current_user = User.find_by(username: params[:username])
  if @current_user && current_user.authenticate(params[:password])
    session[:user_id] = current_user.id
    redirect "/users/#{@current_user.id}"
  else
    redirect "/sessions/new"
  end
end
