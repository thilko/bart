class ServersController < ApplicationController

  before_filter :fetch_server, :only => [ :deploy, :error, :finish ]

  after_filter :save_server, :only => [ :deploy, :error, :finish ]

  def index
    @servers = Server.all
  end

  def deploy
    @server.deploy
    render :nothing => true
  end

  def error
    @server.error
    render :nothing => true
  end
  
  def finish
    @server.finish
    render :nothing => true
  end

private

  def fetch_server
    @server = Server.where(:name=> params[:id]).first
    p @server.inspect
    p @server.respond_to? :deploy
  end

  def save_server
    @server.save
  end
end
