require_relative 'data_mapper_setup'
require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmion

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

validates_confirmation_of :password

end
