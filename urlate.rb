require 'sinatra'

get '/' do
  erb :index
end

get '/admin' do
  erb :admin
end

get '/users/:user' do
  erb :user
end
