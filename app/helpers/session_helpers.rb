def logged_in?
  !!session[:user_id]
end

def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def is_current_user?
  return false unless (current_user && logged_in?)
  current_user.id == @user.id
end

def require_user
  redirect '/' unless logged_in?
end

