require_relative 'data_mapper_setup'
require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  validates_presence_of :email
  validates_confirmation_of :password
end
