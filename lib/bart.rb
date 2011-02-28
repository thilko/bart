require "server"

module Bart
  class App < Sinatra::Base
    DataMapper.setup(:default, "sqlite:///#{File.expand_path("db")}/bart.db")
    DataMapper.auto_upgrade!

    helpers do
      def format_date(date)
        date.strftime("%d.%m.%Y %H:%M:%S")
      end
    end

    get "/server/:name/up" do
      server = first_or_create(params[:name])
      update server, :status => "up"
    end

    get "/server/:name/down" do
      server = first_or_create(params[:name])
      update server, :status => "down"
    end

    get "/server/:name/deploy" do
      server = first_or_create(params[:name])
      update server, :status => "deploy"
    end

    get "/server/:name/log/:message" do
      server = first_or_create(params[:name])
      update server, :message => params[:message]
    end

    get "/" do
      list_server
      haml :index
    end

    private

    def list_server
      @server = Bart::Server.all || []
    end

    def update(server, props = {})
      server.update props.merge(:statusdate => DateTime.now)
    end

    def first_or_create(name)
      Bart::Server.first_or_create(:name => params[:name])
    end
  end
end
