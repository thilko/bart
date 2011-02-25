module Bart
  class Server
    include DataMapper::Resource

    property :id,             Integer, :serial => true
    property :name,           String
    property :status,         String
    property :statusdate,     DateTime, :default => DateTime.now 
  end
end
