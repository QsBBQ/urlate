require 'sinatra'
require_relative 'models'
enable :sessions

helpers do
  def current_user
    @current_user ||= User.get(session[:current_user])
  end

  def login(user)
    @current_user = user
    puts user
    session[:current_user] = user.id
    redirect "/"
  end

  def logged_in?
    !session[:current_user].nil?
  end

  def ensure_logged_in!
    unless logged_in?
      halt 403, "You must be logged in to do that!"
    end
  end
end

get '/' do
  erb :index
end

get '/admin' do
  erb :"admin"
end

post '/users/new' do
  #params.inspect
  @user = User.create(params[:user])
  # if @user.saved?
  #   login(@user)
  # else
  #   "trouble in new user land"
  # end
end

get '/users/:user' do
  erb :user
end

post 'users/:user/edit' do
  #Place holder for edit
end

#
#Session
#
get "/session/new" do
  @login_attempt = User.new
  erb :new_session
end

post "/session/new" do
  @login_attempt = User.first({ :username => params[:user]["username"]})
  #p @login_attempt

  if @login_attempt && @login_attempt.password == params[:user]["password"]
    login(@login_attempt)
  else
    "Need to come back to this"
  end
end

delete "/session" do
  session.delete(:current_user)
  redirect "/"
end