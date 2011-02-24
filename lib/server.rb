module Bart
  class Server
    include DataMapper::Resource

    property :id,    Integer, :serial => true
    property :name, String
    property :status, String
  end
end
