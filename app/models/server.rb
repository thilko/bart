class Server < ActiveRecord::Base

  has_many :logs

  def deploy
    self.status = "deploy"
  end

  def finish
    self.status = "finish"
  end

  def error
    self.status = "error"
  end

end
