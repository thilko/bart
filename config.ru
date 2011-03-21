p "blaaa"
# initiate logging
FileUtils.mkdir_p "log" unless File.directory? "log"
log = File.new "log/bart.log", "a+"
log.sync = true
STDOUT.reopen log
STDERR.reopen log
p "blub"
# setup bundler
require "bundler"
Bundler.require

# ensure lib is in the loadpath
lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)


p "bla"
# roll the dice!
require "bart"
run Bart::App 

