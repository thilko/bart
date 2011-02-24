$:.unshift File.join(File.dirname(__FILE__), '.')

require "sinatra"
require "datamapper"
require "server"

DataMapper.setup(:default, "sqlite:///#{File.expand_path("db")}/bart.db")
DataMapper.auto_upgrade!

get "/server/:name/up" do
  server = first_or_create(params[:name])
  update server, "up"
end

get "/server/:name/down" do
  server = first_or_create(params[:name])
  update server, "down"
end

get "/server/:name/deploy" do
  server = first_or_create(params[:name])
  update server, "deploy"
end

get "/" do
  list_server
  haml :index
end

private

def list_server
  @server = Bart::Server.all || []
end

def update(server, status)
  server.update(:status => status)
end

def first_or_create(name)
  Bart::Server.first_or_create(:name => params[:name])
end
