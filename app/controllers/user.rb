get '/' do
  erb :"user/login"
end

get '/user/new' do
  erb :"user/new_user"
end

post '/user/new' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  Post.create(user: user)
  redirect to ('/user/home')
end

post '/user/authenticate' do
  user = User.authenticate(params[:user][:name],params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect to ('/user/home')
  else
    redirect to ('/user/login')
  end
end

get '/user/home' do
  @user = User.find(session[:user_id])
  erb :"user/home"
end
