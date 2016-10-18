require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'tag'
require_relative 'link'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
DataMapper.auto_upgrade!
