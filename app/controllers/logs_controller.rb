class LogsController < ApplicationController

  def create
    server = Servers.where(params[:server_name]).first
    server.logs << Logs.create(params[:log])
    server.save
  end

end
