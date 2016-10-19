require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

class Link
  include DataMapper::Resource

  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :title,  String
  property :url,    String

  has n, :tags, through: Resource

end
