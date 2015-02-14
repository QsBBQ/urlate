require 'sinatra'

enable :sessions

get '/' do
  erb :index
end

get '/admin' do
  erb :"admin/admin"
end

get '/admin/login' do
  erb :"admin/admin_login"
end

post '/admin/login' do
  session[:username] = params[:username]
  params.inspect
  redirect "/admin"
end

get '/users/:user' do
  erb :user
end
