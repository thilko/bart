$: << "."

require "bart" 
require "rspec"
require "rack/test"

set :environment, :test

DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.auto_upgrade!
