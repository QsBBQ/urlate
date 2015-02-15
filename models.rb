require 'data_mapper'
require 'bcrypt'

DataMapper.setup(:default, 'sqlite:urlate.db')

class User
  include DataMapper::Resource

  property :id, Serial
  property :created_by, String
  property :name, String
  property :email, String
  property :username, String
  property :password, BCryptHash
  property :admin, Boolean
  property :minutes, Integer
  property :created_at, DateTime
end

DataMapper.finalize()
DataMapper.auto_upgrade!()