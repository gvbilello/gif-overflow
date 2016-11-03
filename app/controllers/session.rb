get '/sessions/new' do
   erb :'session/new'
end

post '/sessions' do
  @new_user = User.find_by(username: params[:username])
  if @new_user && @new_user.authenticate(params[:password])
    session[:user_id] = @new_user.id
    redirect "/users/#{@new_user.id}"
  else
    redirect "/sessions/new"
  end
end

delete '/sessions' do
  session.clear
  redirect '/'
end
