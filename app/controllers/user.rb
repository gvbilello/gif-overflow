get '/users/new' do
  erb :'user/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    redirect '/users/new'
  end
end

get '/users/:user_id' do
  @user = User.find_by(id: params[:user_id])
  if @user #and logged in
    erb :'user/show'
  else
    redirect '/'
  end
end
