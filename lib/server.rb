module Bart
  class Server
    include MongoMapper::Document
    set_database_name "bart"

    key :name,           String
    key :status,         String
    key :statusdate,     Time 
    key :message,        String

    def deploy
      `"ssh deploy@#{name} 'rake deploy'"`
    end

    def deployable?
      status == "up"
    end
  end
end
