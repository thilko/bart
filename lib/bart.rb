require "server"

MongoMapper.connection = Mongo::Connection.new("harrington1")

if ENV["RACK_ENV"] == "test"
  MongoMapper.database = 'bart-test'
else
  MongoMapper.database = 'bart'
end

module Bart
  class App < Sinatra::Base
    
    configure do
      set :root, File.expand_path("../../", __FILE__)
      set :method_override, true
    end

    helpers do
      def format_date(date)
        date.strftime("%d.%m.%Y %H:%M:%S")
      end
    end

    get "/server/:name/up" do
      server = first_or_create(params[:name])
      update server, :status => :up
    end

    get "/server/:name/down" do
      server = first_or_create(params[:name])
      update server, :status => :down
    end

    get "/server/:name/deploy" do
      server = first_or_create(params[:name])
      update server, :status => :deploy
    end

    get "/server/:name/log/:message" do
      server = first_or_create(params[:name])
      update server, :message => params[:message]
    end

    put "/server/:name/deploy" do
      server = first_or_create(params[:name])
      server.deploy
      update server, :message => "deployment triggered", :status => :deploy
      redirect back
    end

    get "/" do
      list_server
      haml :index
    end

    private

    def list_server
      # TODO: need the timezone, because mongomapper returns UTC Dates otherwise
      Time.zone="Europe/Berlin"
      @server = Server.all || []
      @server
    end

    def update(server, props = {})
      defaults = {:statusdate => DateTime.now, :message => ""}
      server.update_attributes defaults.merge(props)
      server.save
    end

    def first_or_create(name)
      Server.first_or_create(:name => params[:name])
    end
  end
end
