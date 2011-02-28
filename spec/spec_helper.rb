ENV["RACK_ENV"] ||= "test"

require "bundler"
Bundler.require :default, :test
require "bart"

DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.auto_upgrade!
