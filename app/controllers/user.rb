get '/users/new' do
  erb :'user/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect '/users/new'
  end
end

get '/users/:user_id' do
  @user = User.find_by(id: params[:user_id])
  if @user
    erb :'user/show'
  else
    redirect '/'
  end
end
