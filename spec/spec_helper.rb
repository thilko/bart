ENV["RACK_ENV"] ||= "test"

require "bundler"
Bundler.require :default, :test
require "bart"

