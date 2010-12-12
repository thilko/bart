class LogsController < ApplicationController

  def create
    server = Server.where(:name => params[:server_name]).first
    raise "Server #{params[:server_name]} not found!" unless server

    server.logs << Log.create(params[:log])
    server.save
  end
end
